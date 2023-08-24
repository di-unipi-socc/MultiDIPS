from glob import iglob
from os import makedirs
from os.path import basename, exists

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import sim.data as t
from tabulate import tabulate
from scipy import stats
import numpy as np

'''TYPE_TO_HIDE = [
    'Random_Profit',
    'Random_Carbon',
    'Random_Free HW',
    'Random_Balanced',
]'''

PALETTE = 'colorblind'
TIME_YLIM = (10**-2, 10**3)


def merge_results() -> pd.DataFrame:
    files = iglob(t.ALL_RESULTS)
    df = pd.concat(map(pd.read_csv, files), ignore_index=True)
    return df


def groupby(df, field):
    df = df.groupby('type')[field].agg(['mean', 'min', 'max'])
    df.columns = [f'{field}Avg', f'{field}Min', f'{field}Max']
    return df


def intents_infrs_vs(df, field, infr_sizes, num_intents, heuristics=None, ylabel=None, limit='normal'):
    sns.reset_defaults()
    sns.set(font_scale=1)
    sns.set(rc={'figure.figsize': (11.7, 8.27)})

    for num_intents_value in num_intents:
        for size_value in infr_sizes:
            filtered_df = df[(df['size'] == size_value) & (df['numIntents'] == num_intents_value)]

            if limit == 'low':
                filtered_df = filtered_df[filtered_df['limit'] == 'low']
                name = f'low_{field}_{num_intents_value}-{size_value}'
            else:
                filtered_df = filtered_df[filtered_df['limit'] == 'normal']
                name = f'{field}_{num_intents_value}-{size_value}'

            if heuristics != None:
                filtered_df = filtered_df[filtered_df['type'].isin(heuristics)]

            if filtered_df.empty:
                print(f'No data for {num_intents_value} - {size_value} - {limit}')
                continue

            if field == 'profit':
                group_means = (
                    filtered_df.groupby(['type'])[field].mean().sort_values(ascending=False)
                )
            else:
                group_means = (
                    filtered_df.groupby(['type'])[field].mean().sort_values(ascending=True)
                )

            plot = sns.violinplot(
                x = 'type', 
                y = field, 
                data = filtered_df, 
                cut = 0, 
                order = group_means.index
            )

            plot.set_xticklabels([t.get_text().replace('_', '\n') for t in plot.get_xticklabels()])
            plt.ylabel(ylabel if ylabel else field)

            plt.xticks(rotation=60)

            plt.savefig(t.PLOT_PATH.format(name=name), format=t.PLOT_FORMAT, dpi=t.PLOT_DPI, bbox_inches='tight')
            plt.close()

            with open(t.TXT_PATH.format(name=name), 'w') as f:
                group_by_type_field = filtered_df.groupby(['type'])[field].describe()
                group_by_type_time = filtered_df.groupby(['type'])['time'].describe()
                f.write(str(group_by_type_field) + '\n\n' + str(group_by_type_time))

            print('{} done.'.format(name))


def intents_infrs_vs_v2(df, field, infr_sizes, heuristics=None, ylabel=None, limit='normal'):
    sns.reset_defaults()
    sns.set(font_scale=1.5)
    sns.set(rc={'figure.figsize': (10, 6)})

    for size_value in infr_sizes:
        filtered_df = df[(df['size'] == size_value)]

        if limit == 'low':
            filtered_df = filtered_df[filtered_df['limit'] == 'low']
            name = f'low_{field}-{size_value}'
        else:
            filtered_df = filtered_df[filtered_df['limit'] == 'normal']
            name = f'{field}-{size_value}'

        if heuristics != None:
            filtered_df = filtered_df[filtered_df['type'].isin(heuristics)]

        if filtered_df.empty:
            print(f'No data for {size_value} - {limit}')
            continue

        sns.barplot(
            x = 'numIntents', 
            y = field, 
            data = filtered_df, 
            hue = 'type',
            hue_order = ['MILP', 'Hungriest_Balanced', 'Hungriest_Profit', 'Hungriest_Carbon', 'Hungriest_Free HW',
                         'Longest_Balanced', 'Longest_Profit', 'Longest_Carbon', 'Longest_Free HW', 'Random_Profit',
                        'Random_Carbon', 'Random_Free HW', 'Random_Balanced'],
            errorbar = None,
            palette = PALETTE
        )

        if field == 'time':
            plt.yscale('log')
            
        plt.ylabel(ylabel if ylabel else field)
        plt.xlabel("Number of intents")
        plt.legend(loc='best')

        plt.savefig(t.PLOT_PATH.format(name=name), format=t.PLOT_FORMAT, dpi=t.PLOT_DPI, bbox_inches='tight')
        plt.close()

        with open(t.TXT_PATH.format(name=name), 'w') as f:
            group_by_type_field = filtered_df.groupby(['type','numIntents'])[field].describe()
            f.write(str(group_by_type_field))

        print('{} done.'.format(name))


def size_vs(df, field, num_intents=None, type=None, ylabel=None):
    # set seaborn context
    sns.reset_defaults()
    sns.set(style='whitegrid')
    sns.set_context('notebook', font_scale=1.5, rc={'lines.linewidth': 2.5})

    #df = df[df['limit']=='low']

    if num_intents != None:
        df = df[df['numIntents'].isin(num_intents)]
    else:
        num_intents = 'all'

    if type == 'all_heuristics':
        df = df[df['type'] != 'MILP']
    elif type != None:
        df = df[df['type'] == type]
    else:
        type = 'all'

    if df.empty:
        print(f'No data for {field} - {num_intents} - {type}')
        return

    #df = df.loc[df.groupby(['numIntents','size'])['time'].idxmax()]

    # choose plot
    plt.figure(figsize=(10, 6))

    sns.lineplot(
        x = 'size',
        y = field,
        data = df,
        hue = 'numIntents',
        errorbar = None,
        marker = 'D',
        palette = PALETTE,
    )

    # set labels
    plt.xlabel('Infrastructure Size')
    plt.ylabel(ylabel if ylabel else field)
    plt.legend(title='Num. of intents:', loc='best')

    # save plot
    name = '{}-{}'.format(type, field.lower())
    plt.savefig(t.PLOT_PATH.format(name=name), format=t.PLOT_FORMAT, dpi=t.PLOT_DPI, bbox_inches='tight')
    plt.close()

    with open(t.TXT_PATH.format(name=name), 'w') as f:
        group_by_num_field = df.groupby(['numIntents','size','limit'])[field].describe()
        f.write(str(group_by_num_field))

    print('{} done.'.format(name))


def limit_vs(df, field, type=None, num_intents=None, ylabel=None):
    # set seaborn context
    sns.reset_defaults()
    sns.set(style='whitegrid')
    sns.set_context('notebook', font_scale=1.5, rc={'lines.linewidth': 2.5})

    if num_intents != None:
        df = df[df['numIntents'].isin(num_intents)]
    else:
        num_intents = 'all'

    if type == 'all_heuristics':
        df = df[df['type'] != 'MILP']
    elif type != None:
        df = df[df['type'] == type]
    else:
        type = 'all'

    if df.empty:
        print(f'No data for {field} - {num_intents} - {type}')
        return

    # choose plot
    plt.figure(figsize=(10, 6))

    sns.lineplot(
        x = 'size',
        y = field,
        data = df.assign(Intents=df['numIntents'], Carbon=df['limit']),
        style = 'Carbon',
        hue = 'Intents',
        errorbar=None,
        markers=True,
        palette=PALETTE,
    )

    # set labels
    plt.xlabel('Infrastructure Size')
    plt.ylabel(ylabel if ylabel else field)
    plt.legend(loc='best')

    # save plot
    name = 'limit-{}-{}'.format(type, field.lower())
    plt.savefig(t.PLOT_PATH.format(name=name), format=t.PLOT_FORMAT, dpi=t.PLOT_DPI, bbox_inches='tight')
    plt.close()

    with open(t.TXT_PATH.format(name=name), 'w') as f:
        group_by_num_field = df.groupby(['type','numIntents','limit'])[field].describe()
        f.write(str(group_by_num_field))

    print('{} done.'.format(name))



if __name__ == '__main__':
    try:
        df = merge_results()
        # create plots directory, if not exists
        makedirs(t.PLOTS_DIR) if not exists(t.PLOTS_DIR) else None
    except FileNotFoundError as e:
        raise FileNotFoundError('File not found: {}.'.format(basename(e.filename)))
    except ValueError as e:
        raise ValueError('No file with pattern: {}'.format(t.ALL_RESULTS))

    # Filtering result type
    filtered_df = df[~df['type'].isin(TYPE_TO_HIDE)]

    # Get all infrs sizes and number of intents
    infr_sizes = sorted(filtered_df['size'].unique())
    num_intents = sorted(filtered_df['numIntents'].unique())

    '''
    # Failed placement {numIntents}-{infr_size} with normal and low global intent cap value
    intents_infrs_vs(df=filtered_df, field='failedP', infr_sizes=infr_sizes, num_intents=num_intents, ylabel= 'Failed intent placement', limit='normal')
    intents_infrs_vs(df=filtered_df, field='failedP', infr_sizes=infr_sizes, num_intents=num_intents, ylabel= 'Failed intent placement', limit='low')
    
    # Profit {numIntents}-{infr_size} with normal and low global intent cap value
    intents_infrs_vs(df=filtered_df, field='profit', infr_sizes=infr_sizes, num_intents=num_intents, ylabel='Profit', limit='normal')
    intents_infrs_vs(df=filtered_df, field='profit', infr_sizes=infr_sizes, num_intents=num_intents, ylabel='Profit', limit='low')

    # Profit {numIntents}-{infr_size} only with {heuristics}, normal global intent cap value
    heuristics = [
        'Hungriest_Profit',
        'Hungriest_Carbon',
        'Hungriest_FreeHW',
        'Hungriest_Balanced',
    ]
    # intents_infrs_vs(df=filtered_df, field='profit', infr_sizes=[10], num_intents=[10], heuristics=heuristics, ylabel='Profit', limit='normal')

    # CPU time comparison between different type
    size_vs(df=filtered_df, field='time', type='all_heuristics', ylabel='Time (s)')
    size_vs(df=filtered_df, field='time', type='MILP', ylabel='Time (s)')

    # Low limit value cap vs normal
    limit_vs(df=filtered_df, field='profit', type='MILP', num_intents=None, ylabel='Profit')
    '''

    #size_vs(df=filtered_df, field='time', type='all_heuristics', ylabel='Time (s)')
    #size_vs(df=filtered_df, field='time', type='MILP', ylabel='Time (s)')

    intents_infrs_vs_v2(df=filtered_df, field='profit', infr_sizes=infr_sizes, ylabel='Profit (€)', limit='normal')
    intents_infrs_vs_v2(df=filtered_df, field='profit', infr_sizes=infr_sizes, ylabel='Profit (€)', limit='low')
    
    intents_infrs_vs_v2(df=filtered_df, field='time', infr_sizes=infr_sizes, ylabel='Time (s)', limit='normal')
    intents_infrs_vs_v2(df=filtered_df, field='time', infr_sizes=infr_sizes, ylabel='Time (s)', limit='low')

    intents_infrs_vs_v2(df=filtered_df, field='carbon', infr_sizes=infr_sizes, ylabel='Carbon footprint (kg)', limit='normal')
    intents_infrs_vs_v2(df=filtered_df, field='carbon', infr_sizes=infr_sizes, ylabel='Carbon footprint (kg)', limit='low')

    '''
    with open(t.TXT_PATH.format(name='profit-mean'), 'w') as f:
        filtered_df = df[ (df['size']<=25) & (df['id']==1)]
        mean = filtered_df.groupby(['type','limit'])['profit'].describe()
        f.write(str(mean))'''
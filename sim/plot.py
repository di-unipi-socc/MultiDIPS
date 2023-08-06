from glob import iglob
from os import makedirs
from os.path import basename, exists

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import templates as t
import re
from tabulate import tabulate
from scipy import stats
import numpy as np

sizes = []
rates = []
x = [i for i in range(len(sizes))]

MD_TYPE = [(1,(100, 0, 0)), (1,(0, 100, 0)), (1,(0, 0, 100)), (1,(33.33, 33.33, 33.33)),
           (2,(100, 0, 0)), (2,(0, 100, 0)), (2,(0, 0, 100)), (2,(33.33, 33.33, 33.33)),
           (3,(100, 0, 0)), (3,(0, 100, 0)), (3,(0, 0, 100)), (3,(33.33, 33.33, 33.33)),
           (4,(100, 0, 0)), (4,(0, 100, 0)), (4,(0, 0, 100)), (4,(33.33, 33.33, 33.33))
           ]

TYPE_TO_HIDE = [(1,(100, 0, 0)), (1,(0, 100, 0)), (1,(0, 0, 100)), (1,(33.33, 33.33, 33.33)),
                (4,(100, 0, 0)), (4,(0, 100, 0)), (4,(0, 0, 100)), (4,(33.33, 33.33, 33.33))]

MD_LABELS = {1: 'FIFO', 2: 'Longest', 3: 'Hungriest', 4: 'Random',
             (100, 0, 0): 'Profit', (0, 100, 0): 'Carbon', (0, 0, 100): 'Free HW',
             (33.33, 33.33, 33.33): 'Balanced'}  

PALETTE = "colorblind"
TIME_YLIM = (10**-2, 10**3)

def merge_results() -> pd.DataFrame:
	files = iglob(t.ALL_RESULTS)
	df = pd.concat(map(pd.read_csv, files), ignore_index=True)
	return df

def groupby(df, field):
    df = df.groupby('type')[field].agg(['mean', 'min', 'max'])
    df.columns = [f"{field}Avg", f"{field}Min", f"{field}Max"]
    return df

def type_to_label(x):
    return MD_LABELS[x[0]] + '\n' + MD_LABELS[x[1]]

def md_names(x):
    return f'multiDips_{x[0]}_{x[1]}'

def md_labels(x):
    if x == 'MILP':
        return 'MILP'
    for (i,j) in MD_TYPE:
        if x == f'multiDips_{i}_{j}':
            return MD_LABELS[i] + '\n' + MD_LABELS[j]


def intents_infrs_vs(infr_sizes, num_intents, field, df):
    for num_intents_value in num_intents:
        for size_value in infr_sizes:
            filtered_df = df[(df['size'] == size_value) & (df['numIntents'] == num_intents_value)]

            group_by_type_field = filtered_df.groupby(['type'])[field].describe()
            group_by_type_time = filtered_df.groupby(['type'])['time'].describe()

            if field == 'profit':
                group_means = filtered_df.groupby(['type'])[field].mean().sort_values(ascending=False)
            else:
                group_means = filtered_df.groupby(['type'])[field].mean().sort_values(ascending=True)

            if filtered_df.empty: continue

            sns.violinplot(x='type', y=field, data=filtered_df, cut=0, order=group_means.index)

            if field == 'profit':
                plt.ylabel('Profit')     
            else:
                plt.ylabel('Failed intent placement') 
            
            plt.xticks(rotation=90)
            
            name = f"{field}_{num_intents_value}-{size_value}"
            plt.savefig(t.PLOT_PATH.format(name=name), format=t.PLOT_FORMAT, dpi=t.PLOT_DPI)
            plt.close()
            
            with open(t.TXT_PATH.format(name=name), 'w') as f:
                f.write(str(group_by_type_field) + '\n\n' + str(group_by_type_time))
                
            print("{} done.".format(name))


def size_vs(field, df, ylabel=None, plot_type="lineplot", approach="md"):
    # set seaborn context
    sns.set(style="whitegrid")
    sns.set_context("notebook", font_scale=1.5, rc={"lines.linewidth": 2.5})

    # choose plot
    plt.figure(figsize=(10, 6))
    if plot_type == "lineplot":
        sns.lineplot(x="size", y=field, data=df, style="size", hue="size", errorbar=("sd", 0.1),
                     markers=True, palette=PALETTE)
        #plt.xticks(x, sizes)
    else:
        sns.barplot(x="size", y=field, data=df, palette=PALETTE)
        #plt.xticks(x, sizes)
    
    # set labels and y-scale
    plt.xlabel("Infrastructure Size")
    plt.ylabel(ylabel if ylabel else field)
    plt.legend(loc="best")

    # save plot
    name = "{}-{}".format(field.lower(), approach)
    plt.savefig(t.PLOT_PATH.format(name=name), format=t.PLOT_FORMAT, dpi=t.PLOT_DPI)
    plt.close()
    print("{} done.".format(name))


if __name__ == '__main__':
    try:
        df = merge_results()
        # create plots directory, if not exists
        makedirs(t.PLOTS_DIR) if not exists(t.PLOTS_DIR) else None
    except FileNotFoundError as e:
        raise FileNotFoundError("File not found: {}.".format(basename(e.filename)))
    except ValueError as e:
        raise ValueError("No file with pattern: {}".format(t.ALL_RESULTS))
    
    sns.set(font_scale = 1)
    sns.set(rc={'figure.figsize':(11.7,8.27)})

    # Changing type in human redable labels
    df['type'] = df['type'].map(md_labels)

    # Filtering result type
    filtered_df = df[(~df['type'].isin(map(type_to_label, TYPE_TO_HIDE))) | (df['type'] == 'MILP')]

    # Get all infrs sizes and number of intents
    infr_sizes = sorted(filtered_df['size'].unique())
    num_intents = sorted(filtered_df['numIntents'].unique())

    intents_infrs_vs(infr_sizes, num_intents, 'failedP', filtered_df)

    intents_infrs_vs(infr_sizes, num_intents, 'profit', filtered_df)

    '''
    df_md = df[df['type'] == 'multiDips']
    size_vs("time", df_md, ylabel="Time (s)")
    size_vs("inferences", df_md)
    df_time = groupby(df, 'time')
    '''
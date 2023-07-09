from glob import iglob
from os import makedirs
from os.path import basename, exists

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import templates as t
from tabulate import tabulate
from scipy import stats
import numpy as np

sizes = []
rates = []
x = [i for i in range(len(sizes))]

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


def size_vs(field, df, ylabel=None, plot_type="lineplot", approach="exh"):
    # set seaborn context
    sns.set(style="whitegrid")
    sns.set_context("notebook", font_scale=1.5, rc={"lines.linewidth": 2.5})

    # choose plot
    plt.figure(figsize=(10, 6))
    if plot_type == "lineplot":
        sns.lineplot(x="size", y=field, data=df, style="rate", hue="rate", errorbar=("sd", 0.1),
                     markers=True, palette=PALETTE)
        #plt.xticks(x, sizes)
    else:
        sns.barplot(x="size", y=field, data=df, style="rate", hue="rate", palette=PALETTE)
        plt.xticks(x, sizes)
    
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
    
    sizes = sorted(df['size'].unique())
    rates = sorted(df['rate'].unique())

    df_exh = df[df['type'] == 'exhaustive']
    df_cr = df[df['type'] == 'cr']

    size_vs("time", df_exh, ylabel="Time (s)")
    size_vs("time", df_cr, ylabel="Time (s)", approach="cr")

    size_vs("inferences", df_exh)
    size_vs("inferences", df_cr, approach="cr")

    df_time = groupby(df, 'time')
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# 1
df = pd.read_csv('medical_examination.csv')

# 2
df['overweight'] = [0 if bmi <= 25 else 1 for bmi in df['weight'] / ((df['height'] / 100) ** 2)]

# 3
df['gluc'] = [0 if gluc == 1 else 1 for gluc in df['gluc']]
df['cholesterol'] = [0 if chol == 1 else 1 for chol in df['cholesterol']]


# 4
def draw_cat_plot():
    # 5
    df_cat = pd.melt(df, id_vars=["cardio"],
                     value_vars=["cholesterol", "gluc", "smoke", "alco", "active", "overweight"])

    # 6
    df_cat = df_cat.groupby(["cardio", "variable", "value"]).size().reset_index(name="total")

    # 7 & 8
    fig = sns.catplot(data=df_cat, x="variable", y="total", hue="value", col="cardio", kind="bar", height=5,
                      aspect=1).fig

    # 9
    fig.savefig('catplot.png')
    return fig


# 10
def draw_heat_map():
    # 11
    df_heat = df.copy()
    df_heat = df_heat[
        (df_heat['ap_lo'] <= df_heat['ap_hi']) &
        (df_heat['height'] >= df_heat['height'].quantile(0.025)) &
        (df_heat['height'] <= df_heat['height'].quantile(0.975)) &
        (df_heat['weight'] >= df_heat['weight'].quantile(0.025)) &
        (df_heat['weight'] <= df_heat['weight'].quantile(0.975))
        ]

    # 12
    corr = df_heat.corr()

    # 13
    mask = np.triu(np.ones_like(corr, dtype=bool))

    # 14
    fig, ax = plt.subplots(figsize=(12, 10))

    # 15
    vmin, vmax = -0.16, 0.32  # 📌 Fijamos el rango de colores
    cbar_ticks = np.arange(vmin + 0.08, vmax, 0.08)
    sns.heatmap(corr, mask=mask, annot=True, fmt='.1f', center=0, vmin=vmin, vmax=vmax, linewidths=0.5, square=True,
                ax=ax, cbar_kws={'shrink': 0.5, 'ticks': cbar_ticks})

    # 16
    fig.savefig('heatmap.png')
    return fig

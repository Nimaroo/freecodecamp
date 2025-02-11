import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import linregress
import numpy as np

def calculate_regress(df, label, color):
    fit = linregress(df['Year'], df['CSIRO Adjusted Sea Level']) 
    years = np.arange(df['Year'].min(), 2050 + 1)  
    line = fit.intercept + fit.slope * years
    plt.plot(years, line, color=color, label=label)


def draw_plot():
    # Read data from file
    df = pd.read_csv('epa-sea-level.csv')

    # Create scatter plot
    plt.scatter(df['Year'], df['CSIRO Adjusted Sea Level'], color='blue', label='CSIRO Adjusted Sea level', alpha=0.7)

    # Create first line of best fit
    calculate_regress(df, 'Best fit: all data', 'red')

    # Create second line of best fit
    df_2 = df[df['Year'] >= 2000]
    calculate_regress(df_2, 'Best fit: 2000 onwards', 'green')

    # Add labels and title
    plt.legend()
    plt.xlabel('Year')
    plt.ylabel('Sea Level (inches)')
    plt.title('Rise in Sea Level')
    plt.grid(True, linestyle="--", alpha=0.5)

    
    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()

'''if __name__ == '__main__':
    draw_plot()'''
import numpy as np


def calculate(input_list):
    # First, lets reshape the array (and raise an error in case it does not have 9 digits)
    if len(input_list) != 9:
        raise ValueError('List must contain nine numbers.')
    my_array = np.reshape(input_list, [3, 3])

    # Create the dictionary with the calculations
    calculations = {
        'mean': [my_array.mean(axis=0).tolist(), my_array.mean(axis=1).tolist(), my_array.mean()],
        'variance': [my_array.var(axis=0).tolist(), my_array.var(axis=1).tolist(), my_array.var()],
        'standard deviation': [my_array.std(axis=0).tolist(), my_array.std(axis=1).tolist(), my_array.std()],
        'max': [my_array.max(axis=0).tolist(), my_array.max(axis=1).tolist(), my_array.max()],
        'min': [my_array.min(axis=0).tolist(), my_array.min(axis=1).tolist(), my_array.min()],
        'sum': [my_array.sum(axis=0).tolist(), my_array.sum(axis=1).tolist(), my_array.sum()]
    }

    # Finally, return the dictionary
    return calculations

def items_order(prices, order):
    """Takes in a list and sort direction, calculates if the list is in correct order and returns true or false.
    Valid sort directions: 'Increase' and 'Decrease'
    """
    # Convert each string to a float
    numeric_values = [float(value) for value in prices]
    if order == 'Increase':
        # Check if the list is in increasing order
        for i in range(1, len(numeric_values)):
            if numeric_values[i] < numeric_values[i - 1]:
                return False
        return True
    elif order == 'Decrease':
        # Check if the list is in decreasing order
        for i in range(1, len(numeric_values)):
            if numeric_values[i] > numeric_values[i - 1]:
                return False
        return True
    
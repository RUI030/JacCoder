"""
    Generates a grocery list based on the input dictionary of items and their quantities.

    Parameters:
    items (dict): A dictionary where the keys are item names and the values are quantities.

    Returns:
    list: A list of strings where each string is the item name followed by its quantity.
    """
def generate_grocery_list(items: dict[str, int]) -> list[str] {
    grocery_list = [];
    for (item, quantity) in items.items() {
        grocery_list.append(f"{item}: {quantity}");
    }
    return grocery_list;
}


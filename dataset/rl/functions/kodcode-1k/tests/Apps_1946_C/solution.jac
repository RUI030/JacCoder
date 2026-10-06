"""
    Returns the count of volunteers who are involved in both the reforestation and water cleaning projects.
    """
def count_common_volunteers(n: int, reforestation_volunteers: list[int], b: int, water_cleaning_volunteers: list[int]) -> int {
    reforestation_set = `set(reforestation_volunteers);
    water_cleaning_set = `set(water_cleaning_volunteers);
    common_volunteers = reforestation_set.intersection(water_cleaning_set);
    return len(common_volunteers);
}


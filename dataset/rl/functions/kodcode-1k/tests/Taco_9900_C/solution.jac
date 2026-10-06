"""
    Calculate the total damage based on weapon type and proficiency level.

    Parameters:
    weapon_type (str): The type of the weapon. Can be "sword", "axe", or "bow".
    proficiency_level (int): The proficiency level with the weapon type (0 to 3).

    Returns:
    float: The total damage dealt by the character.
    """
def total_damage(weapon_type: str, proficiency_level: int) -> float {
    if (proficiency_level == 0) {
        return 0;
    }
    base_damage = {"sword": 10, "axe": 15, "bow": 8};
    multipliers = {
        "sword": [1.2, 1.5, 1.8],
        "axe": [1.1, 1.4, 1.7],
        "bow": [1.3, 1.6, 1.9]
    };
    weapon_base_damage = base_damage.get(weapon_type, 0);
    if ((weapon_type not in multipliers) or not (1 <= proficiency_level <= 3)) {
        return 0;
    }
    multiplier = multipliers[weapon_type][(proficiency_level - 1)];
    return (weapon_base_damage * multiplier);
}


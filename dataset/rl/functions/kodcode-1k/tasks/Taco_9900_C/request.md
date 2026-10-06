# total_damage

Calculate the total damage based on weapon type and proficiency level.

Parameters:
weapon_type (str): The type of the weapon. Can be "sword", "axe", or "bow".
proficiency_level (int): The proficiency level with the weapon type (0 to 3).

Returns:
float: The total damage dealt by the character.

Examples:
>>> total_damage("sword", 0) == 0
>>> total_damage("sword", 1) == 12.0

Implement `total_damage(weapon_type: str, proficiency_level: int) -> float`.

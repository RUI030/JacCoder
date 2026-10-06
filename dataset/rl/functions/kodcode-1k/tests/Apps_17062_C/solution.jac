"""
    Return the number of people denied entry based on age and name/nickname rules.
    """
def bouncer_count(people: list[tuple[str, int]]) -> int {
    allowed_names = `set();
    denied_count = 0;
    for (name, age) in people {
        name_lower = name.lower();
        nickname = name_lower[:3];
        if (
            (age < 21)
            or `any(
                existing_name.startswith(nickname) for existing_name in allowed_names
            )
        ) {
            denied_count += 1;
        } else {
            allowed_names.add(name_lower);
        }
    }
    return denied_count;
}


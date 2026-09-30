def dotted_keys(d: dict) -> dict[str, int] {
    out: dict[str, int] = {};
    for (key, value) in d.items() {
        if isinstance(value, dict) {
            for (sub, leaf) in dotted_keys(value).items() {
                out[f"{key}.{sub}"] = leaf;
            }
        } else {
            out[str(key)] = value;
        }
    }
    return out;
}

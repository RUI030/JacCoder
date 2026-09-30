import from main { dotted_keys }

test "flat dict unchanged" { assert dotted_keys({"x": 5, "y": 6}) == {"x": 5, "y": 6}; }
test "empty dict" { assert dotted_keys({}) == {}; }
test "deep nesting" { assert dotted_keys({"a": {"b": {"c": {"d": 7}}}}) == {"a.b.c.d": 7}; }
test "empty branch dropped" { assert dotted_keys({"a": {}, "b": 0}) == {"b": 0}; }
test "siblings" { assert dotted_keys({"p": {"q": 1, "r": {"s": 2}}, "t": 3}) == {"p.q": 1, "p.r.s": 2, "t": 3}; }

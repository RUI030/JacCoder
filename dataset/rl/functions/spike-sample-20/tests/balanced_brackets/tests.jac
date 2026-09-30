import from main { balanced_brackets }

test "empty is balanced" { assert balanced_brackets("") == True; }
test "unclosed" { assert balanced_brackets("{[()]") == False; }
test "early close" { assert balanced_brackets(")(") == False; }
test "interleaved wrong" { assert balanced_brackets("([)]") == False; }
test "nested ok" { assert balanced_brackets("f(x[{1}], y)") == True; }
test "text only" { assert balanced_brackets("no brackets here") == True; }

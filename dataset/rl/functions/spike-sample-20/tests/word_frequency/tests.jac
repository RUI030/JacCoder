import from main { word_frequency }

test "empty text" { assert word_frequency("") == {}; }
test "only punctuation" { assert word_frequency("!! ?? ...") == {}; }
test "case folded" { assert word_frequency("The the THE") == {"the": 3}; }
test "inner punctuation kept" { assert word_frequency("don't stop, don't!") == {"don't": 2, "stop": 1}; }
test "newlines and tabs" { assert word_frequency("a\tb\na b") == {"a": 2, "b": 2}; }

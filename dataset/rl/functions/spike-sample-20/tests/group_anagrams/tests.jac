import from main { group_anagrams }

test "empty" { assert group_anagrams([]) == []; }
test "single word" { assert group_anagrams(["solo"]) == [["solo"]]; }
test "no anagrams" { assert group_anagrams(["c", "a", "b"]) == [["a"], ["b"], ["c"]]; }
test "duplicates kept" { assert group_anagrams(["ab", "ba", "ab"]) == [["ab", "ab", "ba"]]; }
test "case sensitive" { assert group_anagrams(["Ab", "bA", "ab"]) == [["Ab", "bA"], ["ab"]]; }

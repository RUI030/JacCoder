import from main { binary_search }

test "empty" { assert binary_search([], 3) == -1; }
test "first of duplicates" { assert binary_search([2, 4, 4, 4, 9], 4) == 1; }
test "first element" { assert binary_search([-5, 0, 5], -5) == 0; }
test "last element" { assert binary_search([-5, 0, 5], 5) == 2; }
test "above range" { assert binary_search([1, 2, 3], 10) == -1; }
test "long list" { assert binary_search([i * 2 for i in range(1000)], 1234) == 617; }

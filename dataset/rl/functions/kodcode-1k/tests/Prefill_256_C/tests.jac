import from main { fizzbuzz }

test "case 0" {
    want = ['1'];
    got = fizzbuzz(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['1', '2', 'Fizz', '4', 'Buzz'];
    got = fizzbuzz(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz', '11', 'Fizz', '13', '14', 'FizzBuzz'];
    got = fizzbuzz(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['1', '2', 'Fizz'];
    got = fizzbuzz(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['1', '2', 'Fizz', '4', 'Buzz'];
    got = fizzbuzz(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz'];
    got = fizzbuzz(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz', '11', 'Fizz', '13', '14', 'FizzBuzz', '16', '17', 'Fizz', '19', 'Buzz'];
    got = fizzbuzz(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

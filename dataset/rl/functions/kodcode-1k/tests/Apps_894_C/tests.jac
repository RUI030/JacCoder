import from main { generateRomanNumerals }

test "case 0" {
    want = 'I';
    got = generateRomanNumerals(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'II';
    got = generateRomanNumerals(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'III';
    got = generateRomanNumerals(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'IV';
    got = generateRomanNumerals(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'V';
    got = generateRomanNumerals(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'VI';
    got = generateRomanNumerals(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'VII';
    got = generateRomanNumerals(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'VIII';
    got = generateRomanNumerals(8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'IX';
    got = generateRomanNumerals(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'X';
    got = generateRomanNumerals(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'XIV';
    got = generateRomanNumerals(14);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'XIX';
    got = generateRomanNumerals(19);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 'XXIX';
    got = generateRomanNumerals(29);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 'XL';
    got = generateRomanNumerals(40);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 'XLIV';
    got = generateRomanNumerals(44);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 'L';
    got = generateRomanNumerals(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 'LXVIII';
    got = generateRomanNumerals(68);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = 'XC';
    got = generateRomanNumerals(90);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = 'XCIX';
    got = generateRomanNumerals(99);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 19" {
    want = 'C';
    got = generateRomanNumerals(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 20" {
    want = 'CC';
    got = generateRomanNumerals(200);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 21" {
    want = 'CCC';
    got = generateRomanNumerals(300);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 22" {
    want = 'CD';
    got = generateRomanNumerals(400);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 23" {
    want = 'D';
    got = generateRomanNumerals(500);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 24" {
    want = 'DC';
    got = generateRomanNumerals(600);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 25" {
    want = 'DCC';
    got = generateRomanNumerals(700);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 26" {
    want = 'DCCC';
    got = generateRomanNumerals(800);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 27" {
    want = 'CM';
    got = generateRomanNumerals(900);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 28" {
    want = 'M';
    got = generateRomanNumerals(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 29" {
    want = 'MM';
    got = generateRomanNumerals(2000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 30" {
    want = 'MMM';
    got = generateRomanNumerals(3000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 31" {
    want = 'MMMCMXCIX';
    got = generateRomanNumerals(3999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

import from main { classify_sentiment }

test "case 0" {
    want = 1;
    got = classify_sentiment('the product is good and makes me happy');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = classify_sentiment('the service was ok but delivery was terrible');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = classify_sentiment('it was an ok experience overall');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = classify_sentiment('the product was good but the delivery was bad');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = classify_sentiment('great happy good');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = classify_sentiment('sad bad terrible');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = classify_sentiment('this review does not contain any known words');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = classify_sentiment('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = classify_sentiment('neutral neutral ok');
    assert got == want, f"expected={want!r} actual={got!r}";
}

import from main { select_event_loop }

test "case 0" {
    want = 'ProactorEventLoop';
    got = select_event_loop('Windows', 10.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'ProactorEventLoop';
    got = select_event_loop('Windows', 7.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'SelectSelector';
    got = select_event_loop('macOS', 10.7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'SelectSelector';
    got = select_event_loop('macOS', 10.8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'KqueueSelector';
    got = select_event_loop('macOS', 10.9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'KqueueSelector';
    got = select_event_loop('macOS', 11.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'UnknownEventLoop';
    got = select_event_loop('Linux', 5.4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'UnknownEventLoop';
    got = select_event_loop('Android', 9.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'UnknownEventLoop';
    got = select_event_loop('iOS', 14.0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

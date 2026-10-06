import from main { display_message_box }

test "case 0" {
    want = 'Info box displayed.';
    got = display_message_box('info', 'Information', 'This is an info message.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Warning box displayed.';
    got = display_message_box('warning', 'Warning', 'This is a warning message.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Error box displayed.';
    got = display_message_box('error', 'Error', 'This is an error message.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'yes';
    got = display_message_box('question', 'Question', 'Is this a question?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'ok';
    got = display_message_box('okcancel', 'Confirmation', 'Do you wish to proceed?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'retry';
    got = display_message_box('retrycancel', 'Retry', 'Would you like to retry?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'no';
    got = display_message_box('yesno', 'Decision', 'Would you like to continue?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'cancel';
    got = display_message_box('yesnocancel', 'Decision', 'Would you like to save changes?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Invalid message box type provided.';
    got = display_message_box('invalid', 'Error', 'Invalid box type.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

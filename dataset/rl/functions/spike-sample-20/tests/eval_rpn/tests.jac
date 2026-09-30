import from main { eval_rpn }

test "single number" { assert eval_rpn(["42"]) == 42; }
test "truncate toward zero" { assert eval_rpn(["7", "-2", "/"]) == -3; }
test "negative literal" { assert eval_rpn(["-3", "4", "*"]) == -12; }
test "subtraction order" { assert eval_rpn(["10", "4", "-"]) == 6; }
test "longer" { assert eval_rpn(["4", "13", "5", "/", "+"]) == 6; }
test "nested" { assert eval_rpn(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]) == 22; }

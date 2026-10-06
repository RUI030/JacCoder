import re;
def lexical_analyzer(code_string: str) -> list[tuple[str, str]] {
    keywords = {
        "if",
        "else",
        "while",
        "for",
        "return",
        "in",
        "not",
        "and",
        "or",
        "is",
        "None",
        "True",
        "False"
    };
    operators = {
        "+",
        "-",
        "*",
        "/",
        "%",
        "==",
        "!=",
        "<",
        ">",
        "<=",
        ">=",
        "=",
        ":",
        "**"
    };
    token_specification = [
        ('keyword', (r'\b(?:' + '|'.join(re.escape(kw) for kw in keywords) + r')\b')),
        ('identifier', r'\b[a-zA-Z_]\w*\b'),
        ('float', r'\b\d+\.\d*\b'),
        ('integer', r'\b\d+\b'),
        (
            'operator',
            '|'.join(re.escape(op) for op in sorted(operators, key=len, reverse=True))
        ),
        ('whitespace', r'\s+')
    ];
    token_re = re.compile(
        '|'.join(('(?P<%s>%s)' % pair) for pair in token_specification)
    );
    tokens = [];
    for mo in token_re.finditer(code_string) {
        kind = mo.lastgroup;
        value = mo.group();
        if (kind == 'whitespace') {
            continue;
        }
        tokens.append((kind, value));
    }
    return tokens;
}


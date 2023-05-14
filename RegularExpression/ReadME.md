#  Regex Syntax Summary

1. Character: All characters, except those having special meaning in regex, matches themselves. E.g., the regex x matches substring "x"; regex 9 matches "9"; regex = matches "="; and regex @ matches "@".

2. Special Regex Characters: These characters have special meaning in regex (to be discussed below): ., +, *, ?, ^, $, (, ), [, ], {, }, |, \.

3. Escape Sequences (\char):
    To match a character having special meaning in regex, you need to use a escape sequence prefix with a backslash (\). E.g., \. matches "."; regex \+ matches "+"; and regex \( matches "(".
    You also need to use regex \\ to match "\" (back-slash).
    Regex recognizes common escape sequences such as \n for newline, \t for tab, \r for carriage-return, \nnn for a up to 3-digit octal number, \xhh for a two-digit hex code, \uhhhh for a 4-digit Unicode, \uhhhhhhhh for a 8-digit Unicode.
    
4. A Sequence of Characters (or String): Strings can be matched via combining a sequence of characters (called sub-expressions). E.g., the regex Saturday matches "Saturday". The matching, by default, is case-sensitive, but can be set to case-insensitive via modifier.

5. OR Operator (|): E.g., the regex four|4 accepts strings "four" or "4".

6. Character class (or Bracket List):
    [...]: Accept ANY ONE of the character within the square bracket, e.g., [aeiou] matches "a", "e", "i", "o" or "u".
    [.-.] (Range Expression): Accept ANY ONE of the character in the range, e.g., [0-9] matches any digit; [A-Za-z] matches any uppercase or lowercase letters.
    [^...]: NOT ONE of the character, e.g., [^0-9] matches any non-digit.
    Only these four characters require escape sequence inside the bracket list: ^, -, ], \.
    
7. Occurrence Indicators (or Repetition Operators):
    +: one or more (1+), e.g., [0-9]+ matches one or more digits such as '123', '000'.
    *: zero or more (0+), e.g., [0-9]* matches zero or more digits. It accepts all those in [0-9]+ plus the empty string.
    ?: zero or one (optional), e.g., [+-]? matches an optional "+", "-", or an empty string.
    {m,n}: m to n (both inclusive)
    {m}: exactly m times
    {m,}: m or more (m+)
    
8. Metacharacters: matches a character
    . (dot): ANY ONE character except newline. Same as [^\n]
    \d, \D: ANY ONE digit/non-digit character. Digits are [0-9]
    \w, \W: ANY ONE word/non-word character. For ASCII, word characters are [a-zA-Z0-9_]
    \s, \S: ANY ONE space/non-space character. For ASCII, whitespace characters are [ \n\r\t\f]

9. Position Anchors: does not match character, but position such as start-of-line, end-of-line, start-of-word and end-of-word.
    ^, $: start-of-line and end-of-line respectively. E.g., ^[0-9]$ matches a numeric string.
    \b: boundary of word, i.e., start-of-word or end-of-word. E.g., \bcat\b matches the word "cat" in the input string.
    \B: Inverse of \b, i.e., non-start-of-word or non-end-of-word.
    \<, \>: start-of-word and end-of-word respectively, similar to \b. E.g., \<cat\> matches the word "cat" in the input string.
    \A, \Z: start-of-input and end-of-input respectively.

10. Parenthesized Back References:
Use parentheses ( ) to create a back reference.
Use $1, $2, ... (Java, Perl, JavaScript) or \1, \2, ... (Python) to retreive the back references in sequential order.

11. Laziness (Curb Greediness for Repetition Operators): *?, +?, ??, {m,n}?, {m,}?

; SageMath highlights.scm

; Keywords
[
  "and" "as" "assert" "async" "await" "break" "class" "continue" "def"
  "del" "elif" "else" "except" "finally" "for" "from" "global" "if"
  "import" "in" "is" "lambda" "nonlocal" "not" "or" "pass" "raise"
  "return" "try" "while" "with" "yield"
] @keyword

; Built-in functions
(call
  function: (identifier) @function.builtin
  (#any-of? @function.builtin
    "abs" "all" "any" "bin" "bool" "bytearray" "bytes" "chr" "classmethod"
    "compile" "complex" "dict" "divmod" "enumerate" "eval" "exec" "filter"
    "float" "format" "frozenset" "getattr" "globals" "hasattr" "hash" "hex"
    "id" "input" "int" "isinstance" "issubclass" "iter" "len" "list" "locals"
    "map" "max" "memoryview" "min" "next" "object" "oct" "open" "ord" "pow"
    "print" "property" "range" "repr" "reversed" "round" "set" "setattr"
    "slice" "sorted" "staticmethod" "str" "sum" "super" "tuple" "type" "vars" "zip"))

; SageMath-specific functions
(call
  function: (identifier) @function.builtin
  (#any-of? @function.builtin
    "sage" "SR" "var" "solve" "plot" "show" "factorial" "binomial" "fibonacci"
    "prime_range" "rainbow" "matrix" "vector" "RR" "QQ" "ZZ" "CC" "GF"))

; Constants
((identifier) @boolean
 (#match? @boolean "^(True|False)$"))

; String literals
(string) @string

; Numeric literals
(integer) @number
(float) @number

; Comments
(comment) @comment

; Function definitions
(function_definition
  name: (identifier) @function)

; Class definitions
(class_definition
  name: (identifier) @type)

; Decorators
(decorator "@" @punctuation.special (identifier) @function)

; Variables
(assignment
  left: (identifier) @variable)

; Function calls
(call
  function: (identifier) @function)

; Operators
[
  "+" "-" "*" "/" "//" "%" "**" "==" "!=" "<" ">" "<=" ">="
] @operator

; Punctuation
["(" ")" "[" "]" "{" "}"] @punctuation.bracket
["," "." ":" ";"] @punctuation.delimiter

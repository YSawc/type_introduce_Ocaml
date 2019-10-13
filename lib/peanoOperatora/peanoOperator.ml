(* test *)

let test1 = peanoOperator "Z plus S(Z)" = "S(Z)"
let test2 = peanoOperator "Z times S(Z)" = "Z"
let test3 = peanoOperator "S(Z) times S(S(Z))" = "S(S(Z))"
let test4 = peanoOperator "S(S(Z)) times S(S(Z))" = "S(S(S(S(Z))))"

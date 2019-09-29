(* per: parse each number and operator with JSON of the argument *)

(* use *)

# #require "yojson" ;;

# open Yojson ;;

(* test *)
test1 = let perseFormula "Z plus Z" =
    {
        { "operator" : "plus" }
        "numbers": {
            { "number": "Z" },
            { "number": "Z" },
        },
    }
test2 = let perseFormula "Z plus S is S" =
    {
        { "operator" : "plus" }
        "numbers": {
            { "number": "Z" },
            { "number": "S" },
        },
    }

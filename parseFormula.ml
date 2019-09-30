(* per: parse each number and operator with JSON of the argument *)

(* use *)

# #require "yojson" ;;

# open Yojson ;;

(* test *)
test1 = let perseFormula "Z plus Z" =
    {
        "operators" : {
            { "operator" : "plus"},
        },
        "numbers": {
            { "number": "Z" },
            { "number": "Z" },
        },
    }
test2 = let perseFormula "Z plus S is S" =
    {
        "operators" : {
            { "operator" : "plus" },
        }
        "numbers": {
            { "number": "Z" },
            { "number": "S" },
        },
    }

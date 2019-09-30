(* per: parse each operators with JSON of the argment *)

(* use *)

(* TODO: deal with absolutely path *)
#use "../../../assets/operators.ml"

(* func *)

let rec parseOperator str = match str with
    "" -> ""
    str

(* test *)

test1 = parseOperator "Z plus Z" =
    {
        "operators" : {
            { "operator" : "plus" },
        },
    },

test2 = parseOperator "Z times S" =
    {
        "operators" : {
            { "operator" : "times" },
        },
    },


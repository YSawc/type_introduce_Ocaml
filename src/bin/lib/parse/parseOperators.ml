(* per: parse each operators with JSON of the argment *)

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


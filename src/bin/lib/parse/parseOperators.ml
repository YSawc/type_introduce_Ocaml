(* per: parse each operators with JSON of the argment *)

(* use *)

(* TODO: deal with absolutely path *)
#use "../../../assets/operators/operators.ml"
#use "../contains/contains.ml"

(* data__operators *)

let plus = { operator = "plus" }
let times = { operator = "times" }

(* data__operators_list *)
let operatorsList = [plus; times]

(* func *)

let rec parseOperator str operators = match operators with
    [] -> ""
    | { operator = ope } :: rest ->
        if contains str ope
        then ope
        else parseOperator str rest

(* test *)

let test1 = parseOperator "Z plus P" operatorsList = "plus"
let test1 = parseOperator "Z times P" operatorsList = "times"

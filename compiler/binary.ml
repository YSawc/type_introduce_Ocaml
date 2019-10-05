type bit = Zero | One

(* TODO: flag changer *)
let flag (flagArg:bit) (switch:bit) = match flagArg with
    | Zero -> switch = Zero
    | One ->  switch = One
;;

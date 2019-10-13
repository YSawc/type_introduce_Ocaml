let parseWords (str:string) : string list =
  Str.split (Str.regexp " " ) str


let parseWords (words:string) : string list =
  Str.split (Str.regexp " " ) words


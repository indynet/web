open Stdlib.Printf
open Js_of_ocaml
open Util

let set_footer () = use_elem "c" @@ fun x ->
    let t = sprintf
        ("(c) %i All Rights Reserved")
        curr_year
        in

    x##.innerHTML := Js.string t
;;

let () = on_load @@ fun () ->
    set_footer ()
;;

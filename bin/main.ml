open Stdlib.Printf
open Js_of_ocaml
open Stdlib
open Util

let set_footer () = use_elem "c" @@ fun x ->
    let t = sprintf
        ("(c) %i All Rights Reserved")
        curr_year
        in

    x##.innerHTML := Js.string t
;;

let set_mdivs () =
    let rt () = match Random.int 10 with
    | 0 -> "^-^"
    | 1 -> "UwU"
    | 2 -> "=w="
    | 3 -> "^w^"
    | 4 -> ":D"
    | 5 -> ":3"
    | 6 -> "xD"
    | 7 -> ":p"
    | 8 -> ":>"
    | 9 -> ":<"
    | _ -> "xoxo"
    in

    let set_rt x =
        x##.innerHTML := Js.string (rt ())
    in

    iter_elems set_rt
    [ "s1"
    ; "s2"
    ; "s3"
    ]

let () = on_load @@ fun () ->
    Random.self_init ();

    set_footer ();
    set_mdivs ();
;;

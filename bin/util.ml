(* A utility for working with Js_of_ocaml
 *
 * this module does not contain anything
 * that pertains to indycave.xyz
 *)

open Js_of_ocaml

(* infallibly use an element by its id *)
let use_elem id f =
    match Dom_html.getElementById_opt id with
    |   Some x -> f x
    |   None   -> ()
;;

(* infallibly apply elements by their ids *)
let iter_elems f = List.iter (fun x -> use_elem x f) ;;

(* use browser to get current year *)
let curr_year = new%js Js.date_now##getFullYear ;;

(* dom handler ignoring event *)
let on_fire f = Dom_html.handler @@ fun _ -> f (); Js._true ;;

(* callback when dom loads *)
let on_load f = Dom_html.window##.onload := on_fire f ;;

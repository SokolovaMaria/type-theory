open Hw1
open Hw1_reduction

let lambda1 = lambda_of_string "(\\x.y) (\\y.y) ";;
let lambda2 = lambda_of_string "((\\x.a) (\\x.a))";;
List.iter (fun var -> print_string var) (free_vars lambda2);;                                     

(* Test reduction to normal form *)
let l1 = lambda_of_string "(\\x. (x x)) ((\\x. y) z)";;
let l2 = lambda_of_string "(\\x. x x x x) (\\x. x)";;
let l3 = lambda_of_string "(\\f.\\x.f (f (f (f (f x))))) (\\f.\\x.f (f (f (f (f x)))))";;
let l4 = lambda_of_string "(\\n.\\f.\\x.n (\\g.\\h.h (g f)) (\\u.x) (\\u.u)) (\\f.\\x.f (f (f x)))";;
let l5 = lambda_of_string "(\\y.\\m.y (\\f.\\n.(\\s.(s (\\x.\\a.\\b.b) (\\a.\\b.a)) (\\f.\\x.x) (f s)) (m n)) (\\f.\\x.f (f (f x)))) (\\f.(\\x.f (x x)) (\\x.f (x x))) ((\\n.\\f.\\x.n (\\g.\\h.h (g f)) (\\u.x) (\\u.u)))";;
let l6 = lambda_of_string"(\\s.\\k.\\i.(((s ((s (k s)) ((s ((s (k s)) ((s (k k)) i))) (k ((s (k (s ((s (k s)) ((s (k (s (k (s ((s ((s ((s i) (k (k (k i))))) (k ((s (k k)) i)))) (k ((s ((s (k s)) ((s (k k)) i))) (k i))))))))) ((s ((s (k s)) ((s (k k)) ((s (k s)) ((s (k (s (k ((s ((s (k s)) ((s (k k)) ((s (k s)) ((s (k k)) i))))) (k ((s ((s (k s)) ((s (k k)) i))) (k i)))))))) ((s ((s (k s)) ((s (k k)) i))) (k i))))))) (k ((s (k k)) i)))))))) ((s (k k)) ((s ((s (k s)) ((s (k k)) i))) (k i)))))))) (k (k ((s ((s (k s)) ((s (k k)) i))) ((s ((s (k s)) ((s (k k)) i))) ((s ((s (k s)) ((s (k k)) i))) (k i))))))) ((s ((s ((s (k s)) ((s (k k)) i))) (k ((s i) i)))) ((s ((s (k s)) ((s (k k)) i))) (k ((s i) i))))) ((s ((s (k s)) ((s (k (s (k s)))) ((s ((s (k s)) ((s (k (s (k s)))) ((s (k (s (k k)))) ((s ((s (k s)) ((s (k k)) i))) (k ((s (k (s (k (s i))))) ((s (k (s (k k)))) ((s (k (s i))) ((s (k k)) i)))))))))) (k (k ((s (k k)) i))))))) (k (k (k i))))) (\\x.\\y.\\z.x z (y z)) (\\x.\\y.x) (\\x.x)";;
let l7 = lambda_of_string "((\\l0.((\\l1.((\\l2.((\\l3.((\\l4.((\\l5.((\\l6.((\\l7.((\\l8.((\\l9.((\\l10.((\\l11.((\\l12.((\\l13.((l13 (\\l14.(\\l15.(l14 (l14 l15))))) (\\l14.(\\l15.(l14 (l14 (l14 l15))))))) (\\l13.(\\l14.(((l0 (\\l15.(\\l16.(\\l17.(((l1 (l10 l16)) (l12 l17)) (((l1 (l10 l17)) ((l15 (l11 l16)) (\\l18.(\\l19.(l18 l19))))) ((l15 (l11 l16)) ((l15 l16) (l11 l17))))))))) l13) l14))))) (\\l12.(\\l13.(\\l14.((l12 l13) (l13 l14))))))) (\\l11.(\\l12.(\\l13.(((l11 (\\l14.(\\l15.(l15 (l14 l12))))) (\\l14.l13)) (\\l14.l14))))))) (\\l10.((l10 (\\l11.l3)) l2)))) (l0 (\\l9.(\\l10.(\\l11.((\\l12.((\\l13.(((l1 l12) l13) (((l1 l13) l12) ((l9 (l4 l10)) (l4 l11))))) (l8 l11))) (l8 l10)))))))) (\\l8.((l8 (\\l9.l3)) l2)))) (\\l7.(\\l8.((l8 l4) l7))))) (\\l6.(\\l7.((l6 l5) l7))))) (\\l5.(\\l6.(\\l7.((l5 l6) (l6 l7))))))) (\\l4.(\\l5.(\\l6.(((l4 (\\l7.(\\l8.(l8 (l7 l5))))) (\\l7.l6)) (\\l7.l7))))))) (\\l3.(\\l4.l4)))) (\\l2.(\\l3.l2)))) (\\l1.(\\l2.(\\l3.((l1 l2) l3)))))) (\\l0.((\\l1.(l0 (l1 l1))) (\\l1.(l0 (l1 l1))))))";;
let l8 = lambda_of_string "((\\l0.((\\l1.((\\l2.((\\l3.((\\l4.((\\l5.((\\l6.((\\l7.((\\l8.((\\l9.((\\l10.((\\l11.((\\l12.((\\l13.((\\l14.((\\l15.((\\l16.((\\l17.((\\l18.(l18 (\\l19.(\\l20.(l19 (l19 (l19 (l19 (l19 (l19 (l19 (l19 (l19 l20))))))))))))) (\\l18.(l4 (((l17 l18) (\\l19.(\\l20.l20))) l18))))) (l0 (\\l17.(\\l18.(\\l19.(\\l20.(((l1 ((l9 l19) l20)) l19) ((\\l21.(((l1 ((l16 (l14 l21)) l18)) (((l17 l18) ((l6 l21) (\\l22.(\\l23.(l22 l23))))) l20)) (((l17 l18) l19) l21))) (l15 ((l6 l19) l20))))))))))) (l0 (\\l16.(\\l17.(\\l18.((l10 (l8 l17)) (((l1 (l8 l18)) l3) ((l16 ((l7 l17) (\\l19.(\\l20.(l19 l20))))) ((l7 l18) (\\l19.(\\l20.(l19 l20))))))))))))) (l0 (\\l15.(\\l16.(((l1 (l8 (l4 l16))) (\\l17.(\\l18.l18))) ((l6 (\\l17.(\\l18.(l17 l18)))) (l15 (l4 (l4 l16)))))))))) (\\l14.(\\l15.(l14 (l14 l15)))))) (\\l13.((((l0 (\\l14.(\\l15.(\\l16.(\\l17.(((l1 (l8 l15)) l17) (((l14 (l4 l15)) l17) ((l6 l16) l17)))))))) l13) (\\l14.(\\l15.l15))) (\\l14.(\\l15.(l14 l15))))))) (\\l12.(\\l13.(\\l14.((l14 l12) l13)))))) (l0 (\\l11.(\\l12.(\\l13.(((l1 (l8 l12)) (\\l14.(\\l15.l15))) ((l6 l13) ((l11 (l4 l12)) l13))))))))) (\\l10.(\\l11.(((l1 l10) l2) l11))))) (l0 (\\l9.(\\l10.(\\l11.((\\l12.((\\l13.(((l1 l12) l13) (((l1 l13) l12) ((l9 (l4 l10)) (l4 l11))))) (l8 l11))) (l8 l10)))))))) (\\l8.((l8 (\\l9.l3)) l2)))) (\\l7.(\\l8.((l8 l4) l7))))) (\\l6.(\\l7.((l6 l5) l7))))) (\\l5.(\\l6.(\\l7.((l5 l6) (l6 l7))))))) (\\l4.(\\l5.(\\l6.(((l4 (\\l7.(\\l8.(l8 (l7 l5))))) (\\l7.l6)) (\\l7.l7))))))) (\\l3.(\\l4.l4)))) (\\l2.(\\l3.l2)))) (\\l1.(\\l2.(\\l3.((l1 l2) l3)))))) (\\l0.((\\l1.(l0 (l1 l1))) (\\l1.(l0 (l1 l1))))))";;
let l9 = lambda_of_string "((\\l0.((\\l1.((\\l2.((\\l3.((\\l4.((\\l5.((\\l6.((\\l7.((\\l8.((\\l9.((\\l10.(l10 (\\l11.(\\l12.(l11 (l11 (l11 (l11 (l11 (l11 (l11 (l11 (l11 (l11 (l11 (l11 (l11 l12))))))))))))))))) (\\l10.((l0 (\\l11.(\\l12.((\\l13.(((l1 (l8 l13)) (\\l14.(\\l15.(l14 l15)))) ((l6 (l11 l13)) (l11 (l4 l13))))) (l4 l12))))) l10)))) (l0 (\\l9.(\\l10.(\\l11.((\\l12.((\\l13.(((l1 l12) l13) (((l1 l13) l12) ((l9 (l4 l10)) (l4 l11))))) (l8 l11))) (l8 l10)))))))) (\\l8.((l8 (\\l9.l3)) l2)))) (\\l7.(\\l8.((l8 l4) l7))))) (\\l6.(\\l7.((l6 l5) l7))))) (\\l5.(\\l6.(\\l7.((l5 l6) (l6 l7))))))) (\\l4.(\\l5.(\\l6.(((l4 (\\l7.(\\l8.(l8 (l7 l5))))) (\\l7.l6)) (\\l7.l7))))))) (\\l3.(\\l4.l4)))) (\\l2.(\\l3.l2)))) (\\l1.(\\l2.(\\l3.((l1 l2) l3)))))) (\\l0.((\\l1.(l0 (l1 l1))) (\\l1.(l0 (l1 l1))))))";;

let omega = lambda_of_string "(\\x.((x) (x))) (\\x.((x) (x)))";;

(* Normal form witout memoization *)
let reduce_to_normal_form_native lambda = 
        let rec reduce lambda = 
                if (is_normal_form lambda) then lambda
                                                          else reduce (normal_beta_reduction lambda) in 
        reduce lambda;; 

let test_reduction lambda = 
        let start1 = Sys.time() in 
        print_string("Reducing to normal form\n" ^ string_of_lambda(lambda) ^ "\nResult:\n");
        let result = reduce_to_normal_form lambda in 
        print_string (string_of_lambda (result));
        if (is_normal_form result) then print_string ("\nOK") else print_string ("\nResult isn't in normal form");
        let end1 = Sys.time() in
        Printf.printf "\nTime_MEMOIZATION: %f ms\n\n" ((end1 -. start1) *. 1000.0);
        let result1 = reduce_to_normal_form_native lambda in 
        print_string (string_of_lambda (result1));
        Printf.printf "\nTime_NATIVE: %f ms\n\n" ((Sys.time() -. end1) *. 1000.0);;


test_reduction l1;;
test_reduction l2;;
test_reduction l3;;
test_reduction l4;;
test_reduction l5;;
test_reduction l6;;
test_reduction l7;;
test_reduction l8;;
test_reduction l9;;

(* Ω combinator is divergent if it has no β-normal form *)
(* test_reduction omega;;  *)
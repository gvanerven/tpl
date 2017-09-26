module LambdaLibrary where
import Lambda

identity = Lambda "z" (Var "z")
selfApply = Lambda "x" (App (Var "x") (Var "x"))
apply = Lambda "func" (Lambda "arg" (App (Var "func") (Var "arg")))
selectFirst = Lambda "first" (Lambda "second" (Var "first"))
selectSecond = Lambda "first" (Lambda "second" (Var "second"))
conditional = Lambda "first" (Lambda "second" (Lambda "cond" (App (App (Var "cond") (Var "first")) (Var "second"))))
--pair = Lambda "f" (Lambda "s" (Lambda "b" ( App (App (Var "b") (Var "f")) (Var "s"))))
pair = conditional
true = selectFirst
false = selectSecond
notCond = Lambda "x" (App ((App (App conditional false) true)) (Var "x"))
not' = Lambda "x" (App (App (Var "x") false) true)
andCond = Lambda "x" (Lambda "y" (App (App (App conditional (Var "y")) false) (Var "x")))
and' = Lambda "x" (Lambda "y" (App (App (Var "x") (Var "y")) false))
orCond = Lambda "x" (Lambda "y" (App (App (App conditional true) (Var "y")) (Var "x")))
or' = Lambda "x" (Lambda "y" (App (App (Var "x") true) (Var "y")))
zero = Lambda "s" identity
scc = Lambda "n" (Lambda "s" (Lambda "z" (App (Var "s") (App (App (Var "n") (Var "s")) (Var "z")))))
plus = Lambda "m" (Lambda "n" (Lambda "s" (Lambda "z" (App (App (Var "m") (Var "z")) (App (App (Var "n") (Var "s")) (Var "z"))))))
times = Lambda "m" (Lambda "n" (App (App (Var "m") (App plus (Var "n"))) zero))
ifThenElse = Lambda "condition" (Lambda "then" (Lambda "else" (App (App (App conditional (Var "then")) (Var "else")) (Var "condition"))))
isZero = Lambda "m" (App (App (Var "m") (App (Var "x") false)) true)
--fix = λf. (λx. f (λy. x x y)) (λx. f (λy. x x y));
--g = λfct. λn. if realeq n c0 then c1 else (times n (fct (prd n)));
--factorial = fix g;

test = [eval(App (App and' false) true)] ++ [App identity (App (Var "a") (Var "b"))] ++ [eval(App identity (Var "b"))] ++ [eval(App identity (App (Var "a") (Var "b")))]
-- eval(App (App apply (Var "arg")) (Var "boing"))
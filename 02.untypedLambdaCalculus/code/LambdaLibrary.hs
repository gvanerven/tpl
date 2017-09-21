module LambdaLibrary where
import Lambda

identity = Lambda "x" (Var "x")
selfApply = Lambda "x" (App (Var "x") (Var "x"))
apply = Lambda "func" (Lambda "arg" (App (Var "func") (Var "arg")))
selectFirst = Lambda "first" (Lambda "second" (Var "first"))
selectSecond = Lambda "first" (Lambda "second" (Var "second"))
conditional = Lambda "first" (Lambda "second" (Lambda "cond" (App (App (Var "cond") (Var "first")) (Var "second"))))
true = selectFirst
false = selectSecond
notCond = Lambda "x" (App ((App (App conditional false) true)) (Var "x"))
not' = Lambda "x" (App (App (Var "x") false) true)
andCond = Lambda "x" (Lambda "y" (App (App (App conditional (Var "y")) false) (Var "x")))
and' = Lambda "x" (Lambda "y" (App (App (Var "x") (Var "y")) false))
orCond = Lambda "x" (Lambda "y" (App (App (App conditional true) (Var "y")) (Var "x")))
or' = Lambda "x" (Lambda "y" (App (App (Var "x") true) (Var "y")))
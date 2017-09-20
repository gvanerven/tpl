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
notReducted = Lambda "x" (App (App (Var "x") false) true)
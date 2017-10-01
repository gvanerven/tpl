module Testes where

import LambdaLibrary
import Test.HUnit


tc01 = TestCase (assertEqual "test not true" (eval(App not' false)) [true])
tc02 = TestCase (assertEqual "test true and false" (eval(App (App and' true) false)) [false])
tc03 = TestCase (assertEqual "test true or false" (eval(App (App or' true) false)) [true])
tc04 = TestCase (assertEqual "test isZero zero" (eval(App iszero zero)) [true])
tc04 = TestCase (assertEqual "test isZero one" (eval(App iszero (App succ zero))) [false])
tc05 = TestCase (assertEqual "test alpha 01" (eval(App (App apply (Var "arg")) (Var "boing"))) [App (Var "arg") (Var "boing")])
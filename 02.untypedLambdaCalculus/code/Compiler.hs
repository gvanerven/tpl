module Compiler where

import RBL as R
import Lambda as L

translate :: R.Expression -> L.Term
translate Ref Id = Var Id
translate B Bool = if B Boll then true else false
translate N Integer = if N Integer == 0 then zero else scc N Integer - 1
translate Add Expression Expression = plus translate Expression translate Expression
--translate Sub Expression Expression 
translate And Expression Expression = and'translate Expression translate Expression
translate Or  Expression Expression = or' translate Expression translate Expression
translate Not Expression = not'translate Expression translate Expression
translate IfThenElse Expression Expression Expression = ifThenElse (translate Expression) (translate Expression) (translate Expression)
--translate Let Id Expression Expression 
translate Lambda Id Expression = L.Lambda Id (translate Expression)
translate App Expression Expression = L.App (translate Expression) (translate Expression)
module Lambda where

type Id = String 

data Term = Var Id 
          | Lambda Id Term
          | App Term Term
          deriving(Read, Eq)
          
instance Show Term where 
 show (Var x) = x 
 show (Lambda var term) = "\\" ++ var ++ " -> " ++ show term 
 show (App term1 term2) = "(" ++ show term1 ++ " " ++ show term2 ++ ")"
          
eval :: Term -> Term
eval (Var v)             = Var v
eval (Lambda v body)       = Lambda v body
eval (App (Var x) (Var y)) = App (Var x) (Var y)
eval (App (Var x) t)       = Var x
eval (App t (Var y))       = eval(subst var (Var y) body)
 where (Lambda var body)   = eval t
eval (App t1 t2)           = eval(subst var t2 body)
 where (Lambda var body)   = eval t1
            
subst :: Id -> Term -> Term -> Term
subst v t (Var x)
 | v == x = t
 | otherwise = Var x
          
subst v t1 (Lambda x t2)
 | v == x = Lambda x t2
 | otherwise = Lambda x (subst v t1 t2)
          
subst v t1 (App t2 t3) = App (subst v t1 t2) (subst v t1 t3)

--eval (Lambda v (App t1 t2)) = (Lambda v (eval(App t1 t2)))
--subst v t1 (Lambda x t2)
-- | v == x = Lambda x t1
-- | otherwise = Lambda x (subst v t1 t2)
-- λf.f λs.(s s)
--subst v t1 (App t2 t3) = App (subst v (eval(t1)) t2) (subst v (eval(t1)) t3)

module Root.Questoes.Q5.Interpreter where

import Root.Questoes.Q5.AbsLI
import Prelude hiding (lookup)

-- As definições deste arquivo são as mínimas para compilar os testes.
-- Você deverá completar todo o restante do código.
-- Dica: se você fez os exercícios anteriores, boa parte do código
-- pode ser reutilizado neste exercício.

type RContext = [(String, Valor)]

type ErrorMessage = String

data Valor
  = ValorStr String
  | ValorInt Integer
  | ValorBool Bool
  
instance Show Valor where
  show (ValorInt vint) = show vint
  show (ValorStr vstr) = vstr
  show (ValorBool vb) = show vb

instance Eq Valor where
  (ValorInt i1) == (ValorInt i2) = i1 == i2
  (ValorStr s1) == (ValorStr s2) = s1 == s2
  (ValorBool b1) == (ValorBool b2) = b1 == b2

s :: Valor -> String
s (ValorStr str) = str

i :: Valor -> Integer
i (ValorInt vint) = vint

b :: Valor -> Bool
b (ValorBool vbool) = vbool

executeP :: RContext -> Program -> Either ErrorMessage RContext
executeP context (Prog stm) = execute context stm

execute :: RContext -> Stm -> Either ErrorMessage RContext
execute context x = case x of
  SAss id exp -> case eval context exp of
    Right val -> Right (update context (getStr id) val)
    Left msg -> Left msg
  SBlock [] -> Right context
  SBlock (stm : stms) -> case execute context stm of
    Right ctx -> execute ctx (SBlock stms)
    Left msg -> Left msg
  SWhile exp stm -> case eval context exp of
    Right val ->
      if (i val /= 0)
        then case execute context stm of
          Right ctx -> execute ctx (SWhile exp stm)
          Left msg -> Left msg
        else Right context
    Left msg -> Left msg
  SdoWhile stm exp -> case execute context stm of
    Right ctx -> execute ctx (SWhile exp stm)
    Left msg -> Left msg
  STry [] _ stmsF -> execute context (SBlock stmsF)
  STry (stm : stmsT) stmsC stmsF -> case execute context stm of
    Right ctx -> execute ctx (STry stmsT stmsC stmsF)
    Left _ -> execute context (SBlock (stmsC ++ stmsF))

eval :: RContext -> Exp -> Either ErrorMessage Valor
eval context x = case x of
  EAdd exp0 exp -> case eval context exp0 of
    Right ve1 -> case eval context exp of
      Right ve2 -> Right (ValorInt (i ve1 + i ve2))
      Left msg -> Left msg
    Left msg -> Left msg
  ESub exp0 exp -> case eval context exp0 of
    Right ve1 -> case eval context exp of
      Right ve2 -> Right (ValorInt (i ve1 - i ve2))
      Left msg -> Left msg
    Left msg -> Left msg
  EMul exp0 exp -> case eval context exp0 of
    Right ve1 -> case eval context exp of
      Right ve2 -> Right (ValorInt (i ve1 * i ve2))
      Left msg -> Left msg
    Left msg -> Left msg
  EDiv e1 e2 -> case eval context e1 of
    Right ve1 -> case eval context e2 of
      Right ve2 ->
        if (i ve2 == 0)
          then Left ("divisao por 0")
          else Right (ValorInt (i ve1 `div` i ve2))
      Left msg -> Left msg
    Left msg -> Left msg
  ECon exp0 exp -> case eval context exp0 of
    Right ve1 -> case eval context exp of
      Right ve2 -> Right (ValorStr (s ve1 ++ s ve2))
      Left msg -> Left msg
    Left msg -> Left msg
  EOr exp0 exp -> case eval context exp0 of
    Right ve1 -> case eval context exp of
      Right ve2 -> Right (ValorBool (b ve1 || b ve2))
      Left msg -> Left msg
    Left msg -> Left msg
  EAnd exp0 exp -> case eval context exp0 of
    Right ve1 -> case eval context exp of
      Right ve2 -> Right (ValorBool (b ve1 && b ve2))
      Left msg -> Left msg
    Left msg -> Left msg
  ENot exp -> case eval context exp of
    Right ve1 -> Right (ValorBool (not (b ve1)))
    Left msg -> Left msg
  EInt n -> Right (ValorInt n)
  EVar id -> Right (lookup context (getStr id))
  EStr str -> Right (ValorStr str)
  ETrue -> Right (ValorBool True)
  EFalse -> Right (ValorBool False)

getStr :: Ident -> String
getStr (Ident str) = str

lookup :: RContext -> String -> Valor
lookup ((k, v) : cs) str
  | k == str = v
  | otherwise = lookup cs str

update :: RContext -> String -> Valor -> RContext
update [] str v = [(str, v)]
update ((k, v) : cs) str nv
  | k == str = (k, nv) : cs
  | otherwise = (k, v) : update cs str nv
--1

--a

type Data = (Integer, Integer, Integer)

valida::Data->Bool
valida (d,m,a)
  |d <= x || d > y = False
  |m <= x || m > w = False
  |a < x = False
  |otherwise = true
  where x = 0
        w = 12
        y = 31

--b

bissexto::[Integer]->Bool
bissexto x
  |mod x 4 == y && mod x 100 /= y = True
  |mod x 4 == y && mod x 100 == y && mod x 400 == y = True
  |otherwise = False
  where y = 0

--c

valida::Data->Bool
valida (d,m,a)
 | d >= 1 && d <= 31 && (m == 1 || m == 3 || m == 5 || m == 7 ||m == 8 || m == 10 || m == 12) = True
 | d >= 1 && d <= 30 && (m == 4 || m == 6 || m == 9 || m == 11) = True
 | d <= 29 && d >= 1 && m == 2 && (bissexto a == True) = True
 | d <= 28 && d >= 1 && m == 2 = True
 | otherwise = False


precede::Data->Data->Bool
precede (d1,m1,a1) (d2,m2,a2)
 | (d2 > d1) && (m2 == m1) && (a2 == a1) && (valida (d1,m1,a1) == True) && (valida (d2,m2,a2) == True) = True
 | (m2 > m1) && (a2 == a1) && (valida (d1,m1,a1) == True) && (valida (d2,m2,a2) == True) = True
 | (a2 > a1) && (valida (d1,m1,a1) == True) && (valida (d2,m2,a2) == True) = True
 | otherwise = False

pegaData::Emprestimo->Data
pegaData (_,_,_,(d,m,a),_) = (d,m,a)

atrasados::Emprestimos->Data->Emprestimos
atrasados bdEmprestimo (d,m,a) = [ r | r <- bdEmprestimo, (precede (pegaData r) (d,m,a)) == True]

--d

passo::(Int, Int)->(Int, Int)
passo (x, y) = (y, x + y)

auxFibo::Int->(Int,Int)
auxFibo 1 = (1, 1)
auxFibo n = passo (auxFibo (n-1))

fibo2::Int->Int
fibo2 n = do
    where (x, y) = auxFibo n x

--e

prodIntervalo::Int->Int->Int
prodIntervalo m n
 | m == n = n
 | otherwise = n * prodIntervalo m (n -1)

fatorial::Int->Int
fatorial 0 = 1
fatorial 1 = 1
fatorial n = prodIntervalo 1 n


-------------------------------------------------------

--2

--a

type Data = (Integer, Integer, Integer)

valida::Data->Bool
valida (d,m,a)
  |d <= x || d > y = False
  |m <= x || m > w = False
  |a < x = False
  |otherwise = true
  let  x = 0
       w = 12
       y = 31

--b

bissexto::[Integer]->Bool
bissexto x
  |mod x 4 == y && mod x 100 /= y = True
  |mod x 4 == y && mod x 100 == y && mod x 400 == y = True
  |otherwise = False
  let y = 0

--c

valida::Data->Bool
valida (d,m,a)
 | d >= 1 && d <= 31 && (m == 1 || m == 3 || m == 5 || m == 7 ||m == 8 || m == 10 || m == 12) = True
 | d >= 1 && d <= 30 && (m == 4 || m == 6 || m == 9 || m == 11) = True
 | d <= 29 && d >= 1 && m == 2 && (bissexto a == True) = True
 | d <= 28 && d >= 1 && m == 2 = True
 | otherwise = False


precede::Data->Data->Bool
precede (d1,m1,a1) (d2,m2,a2)
 | (d2 > d1) && (m2 == m1) && (a2 == a1) && (valida (d1,m1,a1) == True) && (valida (d2,m2,a2) == True) = True
 | (m2 > m1) && (a2 == a1) && (valida (d1,m1,a1) == True) && (valida (d2,m2,a2) == True) = True
 | (a2 > a1) && (valida (d1,m1,a1) == True) && (valida (d2,m2,a2) == True) = True
 | otherwise = False

pegaData::Emprestimo->Data
pegaData (_,_,_,(d,m,a),_) = (d,m,a)

atrasados::Emprestimos->Data->Emprestimos
atrasados bdEmprestimo (d,m,a) = [ r | r <- bdEmprestimo, (precede (pegaData r) (d,m,a)) == True]

--d

passo::(Int, Int)->(Int, Int)
passo (x, y) = (y, x + y)

auxFibo::Int->(Int,Int)
auxFibo 1 = (1, 1)
auxFibo n = passo (auxFibo (n-1))

fibo2::Int->Int
fibo2 n = do
    let (x, y) = auxFibo n x

--e

prodIntervalo::Int->Int->Int
prodIntervalo m n
 | m == n = n
 | otherwise = n * prodIntervalo m (n -1)

fatorial::Int->Int
fatorial 0 = 1
fatorial 1 = 1
let n = prodIntervalo 1 n
in fatorial n


---------------------------------------------------

--3

1) (??x. 2*x + 1) 3 = 6

2) (??y. -5 y) 7 = -2 

3) (??x. -5 x) 7 = -2

4) (??x.  ??y. -x y)(??z. z/2)

5) (??y -3 y) 1 = 2

6) (??y -9 y) 4 = 5

7) (??x. xx)(??y. y)

-------------------------------------------------

--4

(\x -> x + 3) 5
saida:8

(\x -> \y -> x * y + 5) 3 4
saida:17

(\(x,y) -> x * y^2) (3,4)
saida:48

(\(x,y,_) -> x * y^2) (3,4,2)
saida:48

(\xs -> zip xs [1,2,3]) [4,5,6]
saida:[(4,1),(5,2),(6,3)]

--------------------------------------------------

--5

a) (??x ??y. y)((??z. z)(??z. z))(??w. w) 5


b) func :: Int -> Int
   func y = y^2

c) ((??f. (??x. f(f x)))(??y.(+ y y))) 5


d) func :: Int -> Int
   func x = x + 5 

e) (((??f. (??x. f(f(f x)))) (??y. (y * y))) 2)


f) func :: Int -> Int
   func y = 5 + (y - 3)










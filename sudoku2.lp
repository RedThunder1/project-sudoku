% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...


row(1..9).
col(1..9).
num(1..9).

subgrid(X, Y, G) :- row(X), col(Y), G = 1 + (((X - 1) / 3) * 3 + (Y - 1) / 3).

sudoku(X, Y, N) : num(N) :- row(X), col(Y).

:- initial(X, Y, N), not sudoku(X, Y, N).

:- sudoku(X, COL1, N), sudoku(X, COL2, N), COL1 != COL2.

:- sudoku(ROW1, Y, N), sudoku(ROW2, Y, N), ROW1 != ROW2.

:- sudoku(ROW1, COL1, N),
   sudoku(ROW2, COL2, N),
   subgrid(ROW1, COL1, G),
   subgrid(ROW2, COL2, G),
   ROW1 != ROW2,
   COL1 != COL2.

#show sudoku/3.
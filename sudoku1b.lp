% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...


row(1..4).
col(1..4).
num(1..4).

subgrid(X, Y, G) :- row(X), col(Y), G = 1 + (((X - 1) / 2) * 2 + (Y - 1) / 2).

sudoku(X, Y, N) : num(N) :- row(X), col(Y).

:- initial(X, Y, N), not sudoku(X, Y, N).

:- sudoku(X, COL1, N), sudoku(X, COL2, N), COL1 != COL2.

:- sudoku(ROW1, Y, N), sudoku(ROW2, Y, N), ROW1 != ROW2.

#show sudoku/3.
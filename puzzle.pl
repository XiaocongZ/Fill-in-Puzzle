% Auther: Xiaocong Zhang
% Email: xiaocongz@student.unimelb.edu.au
/*
set_prolog_flag(answer_write_options,
                   [ quoted(true),
                     portray(true),
                     spacing(next_argument)
                   ]).
*/
:- ensure_loaded(library(clpfd)).
:- use_module(library(pairs)).
%-------------------------------------------------------------------------------
% Relevant facts
%-------------------------------------------------------------------------------
/*
WordList is a list of list of length > 1.
Puzzle is a rectangular, not necessarily a square.
*/
%-------------------------------------------------------------------------------
% Test cases
%-------------------------------------------------------------------------------
write_puzzle([]).
write_puzzle([X|Y]) :-
    writeq(X),
    nl,
    write_puzzle(Y).
test(original) :-
    WordList = [[g, i], [i, o], [o, n], [o, r],
                [d, a, g], [e, v, o], [o, e, d], [r, e, f],
                [a, r, i ,d], [c, l, e, f], [c, l, o, d], [d, a, i, s],
                [d, e, n, s], [d, o, l, e], [e, d, i, t], [s, i, l, o],
                [a, r, t, i, c, l, e], [v, e, s, i, c, l, e]],
    Puzzle =   [ [#, #, _, _, _, #, #],
                [#, #, _, _, _, _, #],
                [_, _, _, _, #, _, _],
                [_, _, _, _, _, _, _],
                [_, _, #, _, _, _, _],
                [#, _, _, _, _, #, #],
                [#, #, _, _, _, #, #]],
    time(puzzle_solution(Puzzle, WordList)),
    ground(Puzzle),
    write_puzzle(Puzzle).
test(rect) :-
    WordList = [[g, i], [i, o], [o, n], [o, r],
                [d, a, g], [e, v, o], [o, e, d], [r, e, f],
                [a, r, i ,d], [c, l, e, f], [c, l, o, d], [d, a, i, s],
                [d, e, n, s], [d, o, l, e], [e, d, i, t], [s, i, l, o],
                [a, r, t, i, c, l, e], [v, e, s, i, c, l, e]],
    Puzzle =   [ [#, #, _, _, _, #, #],
                [#, #, _, _, _, _, #],
                [_, _, _, _, #, _, _],
                [_, _, _, _, _, _, _],
                [_, _, #, _, _, _, _],
                [#, _, _, _, _, #, #],
                [#, #, _, _, _, #, #],
                [#, #, #, #, #, #, #]],
    time(puzzle_solution(Puzzle, WordList)),
    ground(Puzzle),
    write_puzzle(Puzzle).

test(0) :-
    Puzzle = [['#',h,'#'],[_,_,_],['#',_,'#']],
    WordList = [[h,a,t], [b,a,g]],
    puzzle_solution(Puzzle, WordList),
    ground(Puzzle),
    write_puzzle(Puzzle).

test(1) :-
    Puzzle =   [[#,_,_,_,#,_,_,_,_,#,#,_,_,_,_],
                [_,_,_,_,#,_,_,_,_,#,_,_,_,_,_],
                [_,_,_,_,#,_,_,_,_,#,_,_,_,_,_],
                [_,_,_,#,#,_,_,_,#,_,_,_,_,_,_],
                [_,_,_,_,_,#,_,_,_,_,_,#,#,#,#],
                [#,#,#,_,_,_,_,#,_,_,_,#,_,_,_],
                [_,_,_,_,_,_,#,_,_,_,_,#,_,_,_],
                [_,_,_,_,#,_,_,_,_,_,#,_,_,_,_],
                [_,_,_,#,_,_,_,_,#,_,_,_,_,_,_],
                [_,_,_,#,_,_,_,#,_,_,_,_,#,#,#],
                [#,#,#,#,_,_,_,_,_,#,_,_,_,_,_],
                [_,_,_,_,_,_,#,_,_,_,#,#,_,_,_],
                [_,_,_,_,_,#,_,_,_,_,#,_,_,_,_],
                [_,_,_,_,_,#,_,_,_,_,#,_,_,_,_],
                [_,_,_,_,#,#,_,_,_,_,#,_,_,_,#]],
    WordList = [[0,5,1],[1,1,1],[1,6,5],[2,2,5],[2,5,6],[3,1,8],[3,3,0],[3,3,7],[5,2,8],[5,5,3],[5,7,4],[5,7,5],[6,4,5],[6,7,2],[7,2,3],[7,7,7],[8,1,9],[8,4,4],[8,8,5],
                [0,2,0,2],[0,2,1,4],[0,3,2,7],[0,5,0,6],[0,7,0,2],[0,8,1,1],[0,8,4,8],[0,9,0,8],[1,2,3,4],[1,2,3,5],[1,4,4,0],[1,9,3,2],[2,3,5,8],
                [3,2,2,6],[3,2,5,2],[3,5,5,9],[3,5,8,2],[3,6,3,3],[3,7,3,7],[4,5,0,1],[5,0,2,1],[5,5,8,8],[5,9,2,8],[6,1,1,0],[6,2,6,2],[6,5,3,5],[6,5,4,1],
                [6,6,5,3],[7,1,1,8],[7,2,5,5],[7,2,8,4],[7,5,8,4],[7,6,2,6],[8,4,1,6],[9,4,0,5],[9,4,4,1],[9,4,5,2],[9,6,5,8],[9,7,9,5],[9,8,8,7],
                [0,8,2,2,5],[1,2,0,1,9],[1,4,3,6,3],[1,7,2,5,2],[1,8,1,1,0],[2,1,0,0,1],[2,3,3,8,2],[2,7,5,1,3],[3,3,2,5,6],[4,4,2,1,7],[4,4,2,9,2],[4,8,1,3,4],[4,8,1,9,5],
                [5,2,0,1,9],[5,2,4,5,4],[0,0,7,0,8,3],[1,9,6,1,1,5],[4,5,0,1,1,5],[5,2,8,9,5,8],[6,3,1,1,5,4],[7,0,7,2,2,1],[9,6,5,6,9,6],[9,8,4,5,6,6],
                [9,1,4,6,3,8,5],[9,1,8,1,7,9,8]],
    time(puzzle_solution(Puzzle, WordList)),
    ground(Puzzle),
    write_puzzle(Puzzle).

test(2) :-
    Puzzle =   [[_,_,_,_,#,_,_,_,_,_,#,_,_,_,_],
                [_,_,_,_,#,_,_,_,_,_,#,_,_,_,_],
                [_,_,_,_,#,_,_,_,_,_,#,_,_,_,_],
                [_,_,_,#,_,_,_,_,#,_,_,_,_,_,_],
                [#,#,_,_,_,_,_,#,_,_,_,_,#,#,#],
                [_,_,_,_,_,_,#,_,_,_,_,_,_,_,_],
                [_,_,_,_,_,#,_,_,_,_,_,#,_,_,_],
                [_,_,_,_,#,_,_,_,_,_,#,_,_,_,_],
                [_,_,_,#,_,_,_,_,_,#,_,_,_,_,_],
                [_,_,_,_,_,_,_,_,#,_,_,_,_,_,_],
                [#,#,#,_,_,_,_,#,_,_,_,_,_,#,#],
                [_,_,_,_,_,_,#,_,_,_,_,#,_,_,_],
                [_,_,_,_,#,_,_,_,_,_,#,_,_,_,_],
                [_,_,_,_,#,_,_,_,_,_,#,_,_,_,_],
                [_,_,_,_,#,_,_,_,_,_,#,_,_,_,_]],
    WordList = [[c,a,l],[f,p,c],[l,i,n],[o,d,e],[t,h,y],[u,g,h],[w,a,s],[y,e,n],
                [b,a,i,t],[c,a,m,e],[c,a,v,e],[c,h,a,d],[c,l,o,d],[c,o,s,y],[c,u,r,d],[c,y,s,t],[e,r,o,s],[f,a,t,e],[f,i,d,e],[f,r,y,e],
                [g,y,r,o],[h,a,l,e],[h,e,e,d],[i,n,d,y],[k,n,o,w],[n,o,l,l],[o,a,t,h],[p,a,r,e],[p,a,u,l],[r,a,r,e],[r,o,l,l],[r,u,d,e],
                [r,u,n,t],[s,e,w,n],[s,l,a,y],[s,p,i,t],[t,a,n,h],[t,h,e,n],[t,r,i,o],[v,o,i,d],[w,a,n,e],[w,a,s,t],[w,i,l,e],[y,a,l,e],
                [a,g,a,i,n],[a,g,o,n,e],[a,w,a,r,d],[c,a,b,l,e],[c,a,l,v,e],[c,a,r,t,e],[c,a,r,v,e],[c,h,a,f,e],[c,h,a,r,d],[c,h,u,t,e],[c,o,u,r,t],
                [c,o,v,e,t],[d,r,a,m,a],[e,l,d,e,r],[e,r,r,o,l],[e,s,t,e,r],[k,o,r,e,a],[k,r,a,f,t],[o,h,a,r,e],[r,h,o,d,a],[s,h,a,d,e],[t,a,s,t,e],
                [c,a,p,u,t,o],[c,h,i,s,e,l],[e,s,k,i,m,o],[e,v,e,l,y,n],[p,a,m,p,e,r],[p,o,n,d,e,r],[s,t,r,e,w,n],[s,t,r,i,d,e],
                [c,o,a,l,e,s,c,e],[e,n,t,e,n,d,r,e],[l,e,a,c,h,a,t,e],[o,r,d,i,n,a,t,e],[s,c,u,l,p,t,u,r,a,l],[s,t,a,n,d,p,o,i,n,t]],
    time(puzzle_solution(Puzzle, WordList)),
    ground(Puzzle),
    write_puzzle(Puzzle).

test(small) :-
    Puzzle =   [[#,_,_,_,#,_,_,_],
                [#,#,#,_,_,_,#,#],
                [#,#,_,_,_,_,_,_],
                [#,#,_,_,_,#,_,_],
                [_,_,#,#,_,_,_,_],
                [_,_,_,_,_,#,#,_],
                [#,#,_,_,#,_,_,_],
                [_,_,_,_,_,_,_,_]
               ],
    WordList = [[c,a,r],[b,a,t],[r,e,d,e],[e,b,e],[b,e,d],[a,d,a,d,a,d],[a,t],[b,a,d,d,y],[d,d,a,d,n,e],[t,o],[t,w,i,n,y],[t,t],[o,w],[i,k,i],
               [k,o],[n,o,v],[r,u,n],[u,n,i,v,e,r,s,e],[r,r],[u,s],[t,e,d],[a,b,c],[b,d],[d,b,c,a]],
    time(puzzle_solution(Puzzle, WordList)),
    ground(Puzzle),
    write_puzzle(Puzzle).
test(large) :-
    WordList = [[o, j, z, d, h, s, w], [m, t, g, e, j, n, v], [d, q, e, v, x, k, j, m, m, q, q, g, t], [x, n], [j, v], [g, e, x, x, b, a, c, v, s, b, f, q, q, s, d, d, f, g, u, p, h, x], [m, s, g, e], [e, k, m, n], [v, y, i, l, t, w, j], [c, j], [u, c, s, a, j], [n, q], [t, w, q, d], [o, g, c, l, v, b, y, m, z], [v, e], [v, z, j, w, g, u, q], [g, w, h, e, p], [d, j], [d, b, c, f], [o, h, g, x, v], [s, z], [b, u, y, g, f, a], [i, v, k], [f, m, z, p, g, a, q, b, b, e, m, w, g, c, w, s, l, d, g, e, p, w], [c, p, m, v, b, x], [c, u, z, o, c, h, d, g, m, b, f, w, b, f], [l, n, f, u, o, o, i, j, m, n, s, x], [g, g, d], [f, f, b, x, a, b, r, z, h, q, p, h, w], [g, n, g], [x, x], [p, b, n, a, l, p, t, f], [t, t, o, k, k, k, q, q, e, z, v, s], [p, a, t, t, o], [g, h, u, l, e], [d, t, q], [i, v, j, x, p, t, s, k, h], [m, q, f, i], [k, a, e, t, f, j, u, f, y, o, m], [d, k, k, g, s], [x, p, a, p, s, e, l], [n, c, q], [q, x, h, i, k, q], [n, f, a, f], [q, a, j, n, q, s, d], [e, z], [z, n, g, g, a, y, b, i, i, r], [y, j], [p, i, o, u, u, z, e], [x, n, s, h], [b, t, z, q, u], [e, s, z], [h, u], [h, m], [p, h, e, o, z], [i, m, m, j, q, b, j, r], [x, w, o, x, x, u, v, g, u, h, j], [q, e, d], [t, f, t, o, q, i, h, i, f, k], [t, z, e, h], [p, f, d, g, u], [w, k], [y, j, j, w, e, l], [u, s, k, d, q, f, m, s], [r, q, i, z, d, e], [m, n], [y, h], [u, z], [v, j, x, i, o, j, z], [z, z, n], [c, c], [p, y], [c, n, j, w, c, g], [r, b, n, a, l, k, d, w, x, d, m], [z, b, x, n], [l, x, d, d, s, a, e], [z, c, c, g, v], [k, a], [o, y, a, g, h, r, t], [c, t, l, w, e], [y, h, v, m, i], [l, o, y], [u, g], [q, z, l, c, d], [m, c, r, g, a, i], [p, z, e, a], [t, z, e, x, b, p], [t, w, p], [g, o], [d, f, x, m, t], [q, q, o, j, x], [s, b, o, k, o, v, n, y, o], [k, c, v, z, x, p, h, q, l, y], [h, e, j, q, d], [b, c, q, e, e, b], [r, y, r], [u, e, l, z, u, d, m, s, n, b], [h, l, k], [b, n, e, k], [f, m], [x, x, a, s, m, u, q], [w, c, o, x, u, f, t], [n, g, q, i, m, j], [q, q, i], [l, u], [i, x, q, t, j], [b, z, g, e, x, p], [j, k], [h, p, h, b, e, n, f, p], [w, y, r, c, j], [t, p, g, g, w, f, p, w, m, g, a], [r, t, m, a, c, n], [m, v, w, h, y, q, z], [e, a], [e, g, t, k, m, m, y, g, p, m], [o, n, y], [e, a, p, s, b, j, v, x], [z, j, h, i, h, q, i, t, h], [d, o, g], [j, y, l, w, z, p, a, g, g, c, q, m, z, f], [t, s], [i, s], [n, o, x, h, l, g, s, w, l], [v, a, h, k, r, m, b, p, c, z, f], [e, t, y, z, g], [j, q, p, e, c, c], [k, d, l, w, c, r], [n, z, u, w, k, d, s, p, g, r, n, q, t, d, c, y], [q, j], [o, g], [m, i, b, m, s, v, w, s, n, d, k, w, v], [j, y, u, f, s, c, b], [u, b, q, m], [w, g, s, c, e, b], [n, n, j, k, t, c, m, m, x, i, m], [g, p], [o, u, m, t, d, f, c, f, a, v, p, n, y, h, q, y, u], [k, u, x, y], [x, i, x, e, z, p, j], [s, w, j, m, u, f], [f, j, u, e, j], [r, a, g], [r, x, x], [b, j], [z, j, g, q], [z, z, b, t, i, d, a], [d, j, v, b], [t, x, y, a, q], [h, i, p], [d, v, e, d, d, p, o, x, t, v, k, f, p, h], [n, o], [r, s, t, t, e, i, s, e], [b, g, c, a, o, j, k], [i, m, t, e, v, a, y, q, p, k], [m, j, p, g, h], [c, q, q], [c, a, h, b, k, x, g, q, o], [f, l, j, l, a, z], [c, z, u], [g, t, q, n, c, j, m], [w, g, k, o, f, q, d, r, k, p, s], [u, p, t], [x, k, g, l, g, v], [q, b, g, k, i, o], [e, m, g], [b, g, z, k, t], [q, u, h, o, u, i, d, h, c, o, z, u], [z, w, m, t, x, k, o], [m, x, n, c, o, b, m, h, q, s], [a, z, e, q, s, o, w, r, d], [x, d], [g, f, m, h, h, d, g], [t, x], [l, h, e, b, q, q, k, w, j, e, o, i, k, j, x, t], [q, p, l], [e, p, y], [l, l], [g, b, q, v, g, m, f, p, e, h], [z, h, d, z, d], [h, z, w, x, w, g, d, g, w], [e, b], [b, x, w, w, h, z], [x, q, i], [i, q], [m, c, c, d, q, u, c, p, m, p, o, s, c, m, w], [j, c, v, y, v, g, b, w, v, m, p, s], [i, f, f], [t, r, f, l, d, o], [g, m, g, w, r, i, g], [n, v, y, m], [c, f], [s, q, a, d, j, m, k, m, z, z, l, g, x, y, m, x, j, a], [b, s], [v, s, i, z], [f, p], [s, z, b, w, a, m], [s, u, k], [o, j], [m, c], [b, l], [s, s], [f, p, i, s, e, x, j, t], [n, x, e, i, t, u, n, f], [a, n, y, v], [s, e], [d, f, t, v, z, l, l], [e, z, n, q, z], [b, t, h], [y, l, a, n, v, b], [q, q, w, e], [d, n, g, t, t, l], [s, b, e, r], [k, p, q, h], [p, r], [w, h, z, w], [e, q, j], [r, g, f, n, t], [z, h, j, h, q, c], [z, q, e, h], [h, t], [z, k, u, s, n], [v, s], [e, u, g, o, l, a, n], [i, c, l], [e, o, j, l, n, b, m], [p, r, w, n, n], [x, d, c, z], [p, o], [g, b], [x, y, a, j, q, k, g, e, a, e, a, m, k, d, j], [k, d, j, j, b, w, o, x, m, k], [g, t, x, p, d, p, d, h], [x, e], [q, n, c, a, g, b, d, k, k], [j, f], [w, u], [i, x], [a, n, a, z, w, f, e, y, d, v, h], [b, i, f, n, p, g, p, s, w, t], [m, g, u, g, y], [g, e, c, y, q, o, d], [s, m], [n, m, p], [s, c, c, p, v, c], [m, u, c, u, g, c, m, p, h, t, q, b, u, x, g, m, s, a, i, t, b], [e, j], [m, b, q, z, g], [q, p, s, q, f, p, n, b, u, f], [x, u, n], [z, o], [v, j, m, f, r, j, m], [q, h, a], [a, m, s, n, l, j, q, i, e, u], [e, k, b], [w, v, z], [n, y, x], [g, x, j, g], [v, x, a, e, u, x, r, s, v, w, y, n, z], [x, o, c, o, q, w, h, x, f, e, q, u, i], [w, i, b], [f, h], [z, g, k, h, j, c, l, b, v, q], [i, y, y], [t, t, f, m], [n, h, v, x, g, p, d, y, i, f], [w, c, o, p, n, e, f], [r, q], [t, y, d, s], [x, b, q, e, k], [g, t, t, o, k], [l, h], [u, c, g, y], [y, e, m, l, c, z], [s, z, c, c, g], [i, d, f, q, m, q, w], [z, g, v], [d, o, b], [u, j], [g, y, b, p]],
    Puzzle =  [[_,_,_,_,_,_,_,#,_,_,_,_,_,_,_,#,_,_,_,_,_,_,_,_,_,_,_,_,_,#,_,_],
                [_,#,_,_,#,#,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,#,#,_,#],
                [_,_,_,_,#,_,_,_,_,#,_,#,_,_,_,_,_,_,_,#,_,_,#,_,_,_,_,_,#,_,_,#],
                [_,_,_,_,#,#,_,_,_,_,_,_,_,_,_,#,_,_,#,_,_,_,_,_,_,_,#,_,_,_,_,_],
                [_,_,#,_,_,_,_,#,_,_,_,_,_,#,#,_,_,#,_,#,#,_,_,_,_,_,_,#,_,_,_,#],
                [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,#,#,_,_,_,_,_,_,#,_],
                [_,_,_,_,_,_,_,_,_,_,_,_,_,_,#,#,_,_,_,_,_,_,_,_,_,_,_,_,#,_,_,_],
                [_,_,_,_,_,_,_,_,_,_,_,_,_,#,#,_,#,_,_,_,#,_,_,#,_,_,_,_,_,_,_,_],
                [_,#,_,_,_,_,_,_,_,_,_,_,_,_,#,_,_,_,_,_,#,_,#,_,_,_,_,_,#,_,_,_],
                [_,#,_,_,_,_,_,_,_,_,_,#,_,_,_,_,#,_,#,_,#,_,_,_,_,_,_,_,_,_,_,_],
                [_,#,_,_,_,_,_,#,#,_,#,_,_,_,_,_,_,_,#,_,#,#,_,_,_,#,_,_,_,_,_,_],
                [_,_,_,_,#,_,#,_,_,_,_,_,_,_,#,_,_,#,_,_,_,_,_,_,_,_,_,_,#,_,#,_],
                [_,_,#,_,_,_,_,_,_,_,#,_,#,_,#,_,_,_,_,#,_,_,_,_,_,#,_,_,_,#,_,#],
                [_,_,#,_,_,#,_,_,_,_,_,#,_,_,_,_,_,_,_,_,#,_,_,_,_,_,_,_,_,_,_,_],
                [_,_,_,#,_,_,_,_,_,_,_,_,_,_,#,_,_,_,_,#,#,_,_,_,_,_,#,_,_,#,#,#],
                [_,_,_,_,_,_,#,_,_,_,_,_,_,_,_,#,#,_,_,_,_,_,_,#,_,_,#,_,_,#,_,_],
                [_,#,_,#,_,_,_,_,_,_,_,#,#,_,_,_,#,#,_,_,#,_,_,#,_,#,_,_,_,_,_,_],
                [#,_,_,_,_,_,_,_,_,_,_,_,#,_,_,_,_,#,#,_,_,_,_,_,_,_,#,_,_,_,_,_],
                [_,_,#,_,_,_,_,_,_,_,#,_,_,_,_,_,#,_,#,#,_,_,_,_,_,#,#,#,_,_,_,#],
                [_,_,#,#,_,_,_,_,_,#,_,_,_,_,_,_,#,_,_,_,_,#,_,#,_,_,_,_,_,_,#,_],
                [_,#,_,_,_,#,_,_,#,_,#,_,_,_,_,_,#,_,_,_,_,_,#,_,_,_,_,_,_,_,_,_],
                [_,#,_,#,_,_,_,_,_,_,_,_,_,_,#,_,#,_,_,_,_,_,#,#,#,#,_,_,_,_,_,_],
                [#,_,_,_,#,_,#,_,_,_,_,_,_,_,_,_,_,#,_,_,_,#,_,_,_,_,#,_,#,_,_,#],
                [_,_,_,_,_,_,_,#,#,#,_,_,_,_,_,_,_,#,#,_,_,_,_,_,_,#,_,_,_,#,_,_],
                [_,_,_,_,_,#,_,_,_,_,_,_,#,_,_,#,_,_,_,_,_,_,_,_,#,#,#,_,_,_,_,_],
                [_,#,#,_,_,_,_,_,_,_,_,_,_,_,#,_,#,_,_,_,_,_,_,#,_,_,_,_,_,_,_,#],
                [_,_,#,_,_,_,_,_,_,_,_,_,_,#,_,_,_,#,#,#,_,_,_,_,_,_,_,_,#,#,#,#],
                [_,_,_,_,_,_,_,_,_,#,_,_,_,#,_,_,_,_,_,_,_,_,_,_,_,_,_,_,#,_,_,#],
                [_,#,_,_,#,_,_,_,_,_,_,_,_,_,#,_,_,_,_,_,_,_,_,_,_,_,#,_,_,_,_,_],
                [_,_,_,_,_,_,#,_,_,_,_,_,_,#,#,#,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
                [#,#,#,#,_,_,#,_,_,#,#,_,_,_,_,_,_,_,_,_,_,_,_,_,#,_,_,_,_,_,_,_],
                [#,#,_,_,_,_,#,#,#,#,#,_,_,_,_,_,_,#,_,_,_,_,_,_,_,_,_,_,_,#,_,_]],
    time(puzzle_solution(Puzzle, WordList)),
    ground(Puzzle),
    write_puzzle(Puzzle).

test(99):-
    WordList= [
    [b, a, n, i],
    [h, a, u, s],
    [n, e, t, z],
    [l, e, n, a],
    [a, n, k, e, r],
    [a, r, i, e, l],
    [g, a, s, s, e],
    [i, n, n, e, n],
    [o, r, a, d, e],
    [s, e, s, a, m],
    [s, i, g, e, l],
    [a, n, g, o, l, a],
    [a, z, e, t, a, t],
    [e, k, a, r, t, e],
    [n, a, t, t, e, r],
    [n, e, n, n, e, r],
    [n, e, s, s, e, l],
    [r, i, t, t, e, r],
    [s, o, m, m, e, r],
    [t, a, u, n, u, s],
    [t, r, a, n, i, g],
    [a, g, e, n, t, u, r],
    [e, r, r, a, t, e, n],
    [e, r, r, e, g, e, r],
    [g, e, l, e, i, s, e],
    [h, a, e, n, d, e, l],
    [k, a, r, o, s, s, e],
    [m, a, n, a, g, e, r],
    [o, s, t, e, r, e, i],
    [s, i, d, e, r, i, t],
    [t, e, r, r, i, e, r],
     [a, n, a, t, o, m, i, e],
    [a, n, p, a, s, s, e, n],
    [b, a, r, k, a, s, s, e],
    [b, e, d, a, n, k, e, n],
    [d, e, k, a, d, e, n, t],
    [e, i, n, l, a, d, e, n],
    [e, r, l, a, s, s, e, n],
    [f, r, a, g, m, e, n, t],
    [g, a, r, a, n, t, i, e],
    [k, r, a, w, a, t, t, e],
    [m, e, i, s, t, e, r, n],
    [r, e, a, k, t, i, o, n],
    [t, e, n, t, a, k, e, l],
    [t, r, i, a, n, g, e, l],
    [u, e, b, e, r, a, l, l],
    [v, e, r, g, e, b, e, n],
    [a, f, r, i, k, a, n, e, r],
    [b, e, s, t, e, l, l, e, n],
    [b, u, l, l, a, u, g, e, n],
    [s, a, n, t, a, n, d, e, r],
    [v, e, r, b, e, r, g, e, n],
    [a, l, l, e, n, s, t, e, i, n],
    [a, u, s, t, r, a, l, i, e, n],
    [b, e, t, e, i, l, i, g, e, n],
    [n, a, t, a, l, i, t, a, e, t],
    [o, b, e, r, h, a, u, s, e, n],
    [u, n, t, e, r, s, t, a, n, d],
    [l, e, u, m, u, n, d]],
    Puzzle= [[_,_,_,_,_,_,_,_,'#',_,_,_,_,_,_,_,_,'#',_,_,_,_,_,_,_],[_,'#','#','#',_,'#','#','#','#',_,'#','#','#',_,'#','#','#','#',_,'#',_,'#','#','#',_],[_,'#',_,'#',_,'#',_,_,_,_,_,_,_,_,_,_,'#','#',_,'#',_,'#','#','#',_],[_,_,_,_,_,_,_,'#','#',_,'#','#','#',_,'#',_,'#',_,_,_,_,_,_,_,_],[_,'#',_,'#',_,'#',_,'#','#',_,'#',_,'#',_,'#',_,'#','#',_,'#',_,'#',_,'#',_],[_,'#',_,'#',_,'#',_,'#',_,_,_,_,_,_,'#',_,'#','#','#','#',_,'#',_,'#',_],[_,'#',_,'#',_,'#',_,'#','#','#','#',_,'#',_,_,_,_,_,_,_,_,'#',_,'#','#'],[_,'#',_,'#',_,_,_,_,_,_,'#',_,'#',_,'#',_,'#',_,'#','#',_,'#',_,'#',_],[_,'#',_,'#','#',_,'#','#',_,'#','#',_,'#','#','#',_,'#',_,'#','#','#','#',_,'#',_],[_,_,_,_,_,_,'#','#',_,_,_,_,_,_,'#',_,'#',_,'#',_,_,_,_,_,_],['#','#','#','#','#',_,'#','#',_,'#','#',_,'#',_,'#',_,'#',_,'#',_,'#','#',_,'#',_],[_,_,_,_,_,_,_,'#',_,'#','#',_,'#',_,'#',_,_,_,_,_,_,_,'#','#',_],[_,'#','#','#','#',_,'#','#',_,'#','#','#','#',_,'#','#','#','#','#',_,'#','#','#','#',_],[_,'#',_,'#','#',_,_,_,_,_,_,_,'#',_,_,_,_,_,_,_,_,'#','#','#',_],[_,'#',_,'#','#','#','#','#',_,'#','#','#','#',_,'#','#','#','#',_,'#','#','#','#','#',_],[_,_,_,_,_,_,'#',_,'#',_,_,_,_,_,_,_,'#',_,_,_,_,_,_,_,_],[_,'#',_,'#','#','#','#',_,'#',_,'#','#','#','#','#','#','#','#',_,'#',_,'#','#','#',_],[_,'#',_,'#',_,_,_,_,_,_,_,_,_,'#','#','#',_,'#',_,'#',_,'#','#','#','#'],[_,'#',_,'#','#','#','#',_,'#',_,'#','#',_,'#','#','#',_,'#',_,'#',_,_,_,_,_],['#','#',_,'#','#','#','#',_,'#','#',_,_,_,_,_,_,_,'#',_,'#',_,'#','#','#',_],[_,_,_,_,_,_,_,_,_,_,'#','#',_,'#','#','#',_,'#','#','#','#',_,'#','#',_],[_,'#',_,'#','#','#','#',_,'#','#',_,'#','#',_,_,_,_,_,_,_,_,_,'#','#',_],[_,'#','#',_,_,_,_,_,_,_,_,_,'#',_,'#','#',_,'#','#','#','#',_,'#','#',_],[_,'#','#','#','#','#','#',_,'#','#',_,'#','#',_,'#','#',_,'#','#','#','#',_,'#','#',_],[_,_,_,_,_,_,_,_,'#','#',_,_,_,_,_,_,_,_,_,'#',_,_,_,_,_]],

    time(puzzle_solution(Puzzle, WordList)),
    ground(Puzzle),
    write_puzzle(Puzzle).
%-------------------------------------------------------------------------------
% Main predicate
%-------------------------------------------------------------------------------
puzzle_solution(Puzzle, WordList) :-
    %size(Puzzle, Row, Column),
    transpose(Puzzle, Puzzle_transpose),
    get_slots_in_puzzle(Puzzle, [], S1),
    get_slots_in_puzzle(Puzzle_transpose, [], S2),
    append(S1, S2, Slots),
    group_slot(Slots, SlotGroups),
    sort_by_occurence(WordList, SortedWordList),
    !,
    length(Slots, Ns),
    solve(SlotGroups, SortedWordList).

solve(_, []).
solve(SlotGroups, [Word|R]) :-
    length(Word, N),
    member(N-Group, SlotGroups),
    match_group(Group, Word),
    solve(SlotGroups, R).
match_group([Slot|R], Word) :-
    Slot = Word;
    match_group(R, Word).

get_slots_in_puzzle([], Acc, Acc).

get_slots_in_puzzle([X|Y], Acc, SlotList) :-
    get_slots_in_row(X, [], L),
    append(L, Acc, Acc1),
    get_slots_in_puzzle(Y, Acc1, SlotList).

get_slots_in_row([], Acc, Acc).
get_slots_in_row([_], Acc, Acc).
get_slots_in_row(Row, Accu, SlotList) :-
    nth0(0, Row, Digit0, R),
    (%a serious bug.
    var_or_filled(Digit0) ->
        (
        first_nonvar(Row, 0, N),
        N > 1 ->
            length(S, N),
            append(S, RR, Row),
            get_slots_in_row(RR, [S|Accu], SlotList)
            ;
            length(S, 2),
            append(S, RR, Row),
            get_slots_in_row(RR, Accu, SlotList)
        )
        ;
        get_slots_in_row(R, Accu, SlotList)
    )
    .

first_nonvar([], Acc, Acc).
first_nonvar([X|Y], Acc, Index) :-
    var_or_filled(X) ->
        Acc1 is Acc + 1,
        first_nonvar(Y, Acc1, Index)
        ;
        first_nonvar([], Acc, Index)
        .
var_or_filled(X) :-
    var(X) ->
        true
        ;
        X \= '#' .
%-------------------------------------------------------------------------------
% Solve the puzzle
%-------------------------------------------------------------------------------



%-------------------------------------------------------------------------------
% Sorting words
%-------------------------------------------------------------------------------

% sort_by_occurence([[h,a,t], [4], [a,a], [b,a,g], [a], [b], [c]], Sorted).
sort_by_occurence(WordList, Sorted) :-
    group_word(WordList, SortedGroups),
    group_to_list(SortedGroups, Sorted).
% Group Word in Wordlist and make list of groups, ordered in occurence.
% + -
% group_word( [[h,a,t], [a,a], [b,a,g], [a], [b], [c]], X).
% X = [[[a, a]], [[h, a, t], [b, a, g]], [[a], [b], [c]]].
group_word(WordList, GroupList) :-
    map_list_to_pairs(length, WordList, Pairs),
    keysort(Pairs, SortedPairs),
    group_pairs_by_key(SortedPairs, Groups),
    maplist(key_to_occurence, Groups, GroupsOccurence),
    keysort(GroupsOccurence, SortedGroups),
    pairs_values(SortedGroups, GroupList).

group_slot(SlotList, Groups) :-
    map_list_to_pairs(length, SlotList, Pairs),
    keysort(Pairs, SortedPairs),
    group_pairs_by_key(SortedPairs, Groups).
% + -
key_to_occurence(Pair0, Pair1) :-
    Pair0 = _-V0,
    length(V0, N),
    Pair1 = N-V0.
% Put sorted groups in one list
% + -
group_to_list([], []).
group_to_list([Lx|Lxs], List) :-
    append(Lx, Rest, List),
    group_to_list(Lxs, Rest).

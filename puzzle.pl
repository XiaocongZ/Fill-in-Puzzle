% Auther: Xiaocong Zhang
% Email: xiaocongz@student.unimelb.edu.au

:- ensure_loaded(library(clpfd)).
:- use_module(library(pairs)).
/*
##dag##
##arid#
edit#or
vesicle
on#clef
#silo##
##oed##

WordList0 = [[g, i], [i, o], [o, n], [o, r],
[d, a, g], [e, v, o], [o, e, d], [r, e, f],
[a, r, i ,d], [c, l, e, f], [c, l, o, d], [d, a, i, s],
[d, e, n, s], [d, o, l, e], [e, d, i, t], [s, i, l, o],
[a, r, t, i, c, l, e], [v, e, s, i, c, l, e]],
Puzzle0 = [ [#, #, _, _, _, #, #],
            [#, #, _, _, _, _, #],
            [_, _, _, _, #, _, _],
            [_, _, _, _, _, _, _],
            [_, _, #, _, _, _, _],
            [#, _, _, _, _, #, #],
            [#, #, _, _, _, #, #]],
*/
puzzle_solution(Puzzle, WordList) :-
    nth0(0, Puzzle, FirstRow),
    length(FirstRow, N),
    N_square is N * N,
    transpose(Puzzle, Puzzle_transpose),
    length(Puzzle_transpose, N),
    row_length(Puzzle_transpose, N),
    sort_by_occurence(WordList, SortedWordList),
    fill(Puzzle, Puzzle_transpose, SortedWordList).

row_length([], _).
row_length([X|Y], N) :-
    length(X, N),
    row_length(Y, N).
to_flat([],[]).
to_flat([X|Y], Flat) :-
    append(X, Rest, Flat),
    to_flat(Y, Rest).
transpose(Puzzle, Puzzle_transpose) :-
    nth0(0, Puzzle, FirstRow),
    length(FirstRow, N),
    Index is N * N - 1,
    transpose(Puzzle, Puzzle_transpose, N, Index).
transpose(Puzzle, Puzzle_transpose, _, -1).
transpose(Puzzle, Puzzle_transpose, N, Index) :-
    X is Index mod N,
    Y is Index // N,
    nth0(Y, Puzzle, Row),
    nth0(X, Row, Item),
    nth0(X, Puzzle_transpose, Column),
    nth0(Y, Column, Item),
    Next_Index is Index - 1,
    transpose(Puzzle, Puzzle_transpose, N, Next_Index).

% Puzzle is the whole puzzle, Word is a list with length > 1.
% - +
fill_horizontal([X|Y], Word) :-
    fill_row(X, Word);
    fill_horizontal(Y, Word).
fill_row(Row, Word) :-
    %Word has at least 2 digits
    Row = [_|RestRow],
    (
    append(Word, _, Row);
    fill_row(RestRow, Word)
    ).

fill(_, _, []).
fill(Puzzle, Puzzle_transpose, [Word|Rest]) :-
    (
    fill_horizontal(Puzzle, Word);
    fill_horizontal(Puzzle_transpose, Word)
    ),
    fill(Puzzle, Puzzle_transpose, Rest).

% sort_by_occurence([[h,a,t], [4], [a,a], [b,a,g], [a], [b], [c]], Sorted).
sort_by_occurence(WordList, Sorted) :-
    group_word(WordList, SortedGroups),
    group_to_list(SortedGroups, Sorted).
% Group Word in Wordlist and make list of groups, ordered in occurence.
% group_word( [[h,a,t], [a,a], [b,a,g], [a], [b], [c]], X).
% X = [[[a, a]], [[h, a, t], [b, a, g]], [[a], [b], [c]]].
group_word(WordList, O) :-
    map_list_to_pairs(length, WordList, Pairs),
    keysort(Pairs, SortedPairs),
    group_pairs_by_key(SortedPairs, Groups),
    maplist(key_is_length, Groups, GroupsOccurence),
    keysort(GroupsOccurence, SortedGroups),
    pairs_values(SortedGroups, O).
key_is_length(Pair0, Pair1) :-
    Pair0 = _-V0,
    length(V0, N),
    Pair1 = N-V0.
% Put sorted groups in one list
group_to_list([], []).
group_to_list([Lx|Lxs], List) :-
    append(Lx, Rest, List),
    group_to_list(Lxs, Rest).

clc;
clear all;
close all;

A = rand(100);
# question a
A(45 : 49, 34 : 37)
# question b
number = 0;
for i = 1: size(A, 1)
	for j = 1 : size(A, 2)
		if A(i, j) > 0.5
			number = number + 1;
		endif
	endfor
endfor
number

# question c
total = sum(sum(A));
total

# question d
average = total / (size(A, 1) * size(A,2));
average

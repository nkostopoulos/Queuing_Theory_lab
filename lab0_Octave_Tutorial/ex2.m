clc;
clear all;
close all;

A = [2, 7, 3; 4, -5, -1; 2, -4, 1];
b = [5; 10; -1];
x = inv(A) * b;
x

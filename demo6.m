% Example: two queues in a row. The output of the first queue is the input of the second. 
% The output of the second queue is the input of the first queue.

clc;
clear all;
close all;

mu1 = 4; % queue 1
mu2 = 2; % queue 2

% state (n1,n2): n1 clients in the first queue and n2 in the second.
% mind that n1 + n2 = 3
% arrivals at each state. State 3 stands for (0,3).
arrivals(3) = 0;
arrivals(12) = 0;
arrivals(21) = 0;
arrivals(30) = 0;
total_arrivals = 0; 

% threshold definition
threshold = mu1/(mu1 + mu2);
% system starts at state 3
current_state = 3;
% count the time steps of the simulation
steps = 0;

previous_mean1 = 0;
previous_mean2 = 0;

% times checked for convergence
times = 0;

while true
  steps = steps + 1;
  % every 1000 steps check for convergence
  if mod(steps,1000) == 0
    times = times + 1;
    
    % total time in every state
    T3 = 1/mu2 * arrivals(3);
    T12 = 1/(mu1 + mu2) * arrivals(12);
    T21 = 1/(mu1 + mu2) * arrivals(21);
    T30 = 1/mu1 * arrivals(30);
    
    % total time in all states
    total_time = T3 + T12 + T21 + T30;
    % Probability of every state
    P(3) = T3/total_time;
    P(12) = T12/total_time;
    P(21) = T21/total_time;
    P(30) = T30/total_time;
    
    % mean number of clients in queues 1 and 2
    current_mean1 = P(12) + 2 * P(21) + 3 * P(30);
    current_mean2 = P(21) + 2 * P(12) + 3 * P(3);
    
    clients_1(times) = current_mean1;
    clients_2(times) = current_mean2;
    
    % check both queues for convergence
    if abs(current_mean1 - previous_mean1)<0.00001 && abs(current_mean2 - previous_mean2) < 0.00001
      break;
    endif
    
    previous_mean1 = current_mean1;
    previous_mean2 = current_mean2;
    
  endif
  
  arrivals(current_state) = arrivals(current_state) + 1;
  total_arrivals = total_arrivals + 1;
  
  % get a random number from uniform distribution
  random_number = rand(1);
  if current_state == 3
    current_state = 12;
  elseif current_state == 12
    if random_number < threshold
      current_state = 3;
    else
      current_state = 21;
    endif
  elseif current_state == 21
    if random_number < threshold
      current_state = 12;
    else
      current_state = 30;
    endif
  else
    current_state = 21;
  endif
  
endwhile

P(3)
P(12)
P(21)
P(30)
clients_1(end)
clients_2(end)

figure(1);
hold on;
plot(clients_1,'r',"linewidth",1.3);
plot(clients_2,'b',"linewidth",1.3);
title("average number of clients in the system");
legend("Q1","Q2");
hold off;

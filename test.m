close all;
clear;
clc;
h = waitbar(0, sprintf("Group ID: 0 / m = 0.00%%"), "Name", "Progress of Constructing");

% 1)
fprintf("开始执行第一组代码。\n");
tic;
n = 256;
m = 9753;
% lm = 256;
q = 4093;
setup(n, m, q, h, 1);
elapsedTime = toc;
fprintf("第一组代码执行完毕，耗时为 %.6f 秒。\n\n", elapsedTime);

% 2)
fprintf("开始执行第二组代码。\n");
tic;
n = 320;
m = 13133;
% lm = 256;
q = 8191;
setup(n, m, q, h, 2);
elapsedTime = toc;
fprintf("第二组代码执行完毕，耗时为 %.6f 秒。\n\n", elapsedTime);

close(h);
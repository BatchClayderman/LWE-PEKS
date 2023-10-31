close all;
clear;
clc;
h = waitbar(0, sprintf("Group ID: 0 / m = 0.00%%"), "Name", "Progress of Constructing");

% 1)
fprintf("开始执行第一组代码。\n");
n = 256;
m = 9753;
c = rand(2 * n, m);
w = rand(n, m);
sk = rand(n, m);
q = rand();
k = 1000;
loopTime = floor(k / 100);
elapsedTime = zeros(loopTime);
waitbar(0, h, sprintf("Group 1: 0 / %d = 0.00%%", loopTime));
cnt = 1;
for i = 1:loopTime
	tic;
	search(c, w, sk, q, floor(k / 100) * i);
	elapsedTime(cnt) = toc;
	waitbar(cnt / loopTime, h, sprintf("Group 1: %d / %d = %0.2f%%", cnt, loopTime, cnt * 100 / loopTime));
	cnt = cnt + 1;
end
fprintf("[%.3f", elapsedTime(1));
for cnt = 2:loopTime
	fprintf(", %.3f", elapsedTime(cnt));
end
fprintf("]\n");
fprintf("第一组代码执行完毕，平均耗时为 %.3f / %d = %.6f 毫秒。\n\n", sum(elapsedTime(:)), loopTime, sum(elapsedTime(:)) / loopTime);

% 2)
fprintf("开始执行第二组代码。\n");
n = 320;
m = 13133;
c = rand(2 * n, m);
w = rand(n, m);
sk = rand(n, m);
q = rand();
k = 1000;
loopTime = floor(k / 100);
elapsedTime = zeros(loopTime);
waitbar(0, h, sprintf("Group 1: 0 / %d = 0.00%%", loopTime));
cnt = 1;
for i = 1:loopTime
	tic;
	search(c, w, sk, q, floor(k / 100) * i);
	elapsedTime(cnt) = toc;
	waitbar(cnt / loopTime, h, sprintf("Group 1: %d / %d = %0.2f%%", cnt, loopTime, cnt * 100 / loopTime));
	cnt = cnt + 1;
end
fprintf("[%.3f", elapsedTime(1));
for cnt = 2:loopTime
	fprintf(", %.3f", elapsedTime(cnt));
end
fprintf("]\n");
fprintf("第二组代码执行完毕，平均耗时为 %.3f / %d = %.6f 毫秒。\n\n", sum(elapsedTime(:)), loopTime, sum(elapsedTime(:)) / loopTime);

close(h);
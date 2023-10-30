close all;
clear;
clc;
h = waitbar(0, sprintf("Group ID: 0 / m = 0.00%%"), "Name", "Progress of Constructing");

% 1)
fprintf("开始执行第一组代码。\n");
n = 256;
m = 9753;
l = 100;
q = 4093;
pk = rand(n, m);
sk = rand(n, n);
loopTime = floor(l / 10);
elapsedTime = zeros(loopTime);
waitbar(0, h, sprintf("Group 1: 0 / %d = 0.00%%", loopTime));
cnt = 1;
for i = 10:10:l
	tic;
	derive(n, m, i, q, pk, sk);
	elapsedTime(cnt) = toc;
	waitbar(cnt / loopTime, h, sprintf("Group 1: %d / %d = %0.2f%%", cnt, loopTime, cnt * 100 / loopTime));
	cnt = cnt + 1;
end
fprintf("[%.3f", elapsedTime(1));
for cnt = 2:loopTime
	fprintf(", %.3f", elapsedTime(cnt));
end
fprintf("]\n");
fprintf("第一组代码执行完毕，平均耗时为 %.3f / %d = %.6f 万秒。\n\n", sum(elapsedTime(:)), loopTime, sum(elapsedTime(:)) / loopTime);

% 2)
fprintf("开始执行第二组代码。\n");
n = 320;
m = 13133;
l = 100;
q = 8191;
pk = rand(n, m);
sk = rand(n, n);
loopTime = floor(l / 10);
elapsedTime = zeros(loopTime);
waitbar(0, h, sprintf("Group 2: 0 / %d = 0.00%%", loopTime));
cnt = 1;
for i = 10:10:l
	tic;
	derive(n, m, i, q, pk, sk);
	elapsedTime(cnt) = toc;
	waitbar(cnt / loopTime, h, sprintf("Group 2: %d / %d = %0.2f%%", cnt, loopTime, cnt * 100 / loopTime));
	cnt = cnt + 1;
end
fprintf("[%.3f", elapsedTime(1));
for cnt = 2:loopTime
	fprintf(", %.3f", elapsedTime(cnt));
end
fprintf("]\n");
fprintf("第二组代码执行完毕，平均耗时为 %.3f / %d = %.6f 万秒。\n\n", sum(elapsedTime(:)), loopTime, sum(elapsedTime(:)) / loopTime);

close(h);
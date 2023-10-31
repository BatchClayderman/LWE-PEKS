function [A, S] = TrapGen(n, m, q, h, id)
	A = round((q - 1) * rand(n, m)); % n * m
	fprintf("Size(A) = (%d, %d)\n", size(A));
	B = zeros(n, m); % n * m
	fprintf("Size(B) = (%d, %d)\n", size(B));
	for i = 1:m
		B(:, i) = A(:, m - i + 1);
	end
	D = uptri(B, q); % n * m
	fprintf("Size(D) = (%d, %d)\n", size(D));
	E = constructE(D, q, h, id); % m * m
	fprintf("Size(E) = (%d, %d)\n", size(E));
	T = ones(size(E)); % m * m
	fprintf("Size(T) = (%d, %d)\n", size(T));
	for i = 1:m
		T(i, :) = E(m - i + 1, :);
	end
	P = T; % m * (m - n)
	fprintf("Size(P) = (%d, %d)\n", size(P));
	for j = 1:m - n
		P(:, j) = T(:, m - n - j + 1);
	end
	Q = q * eye(n, n); % n * n
	fprintf("Size(Q) = (%d, %d)\n", size(Q));
	O = zeros(m - n, n); % (m - n) * n
	fprintf("Size(O) = (%d, %d)\n", size(O));
	T = [O; Q]; % m * n
	fprintf("Size(T) = (%d, %d)\n", size(T));
	S = [P, T]; % m * (m + n)
	fprintf("Size(S) = (%d, %d)\n", size(S));
end

function E = constructE(D, q, h, id)
	[n, m] = size(D);
	E = zeros(m, m);
	waitbar(0, h, sprintf("Group %d: 0 / %d = 0.00%%", id, m));
	r = floor(2560 / n);
	for i = 1:m
		E(i, 1:n) = SF(D, q)';
		waitbar(i / m, h, sprintf("Group %d: %d / %d = %.2f%%", id, i, m, i * 100 / m));
	end
end

function shortestVector = SF(D, q) % D: n x m 的格基矩阵，q: LLL算法中的参数
	% 返回最短向量 shortestVector
	n = size(D, 2); % 矩阵的列数
	
	% 初始化
	B = D;
	mu = zeros(n, n);
	beta = zeros(n, 1);
	
	% LLL 算法主循环
	for j = 2:n
		for i = j - 1:-1:1
			mu(i, j) = round(B(:, i)' * B(:, j) / beta(i));
			B(:, j) = B(:, j) - mu(i, j) * B(:, i);
		end
		beta(j) = norm(B(:, j))^2;
		if beta(j) >= (1 - q) * beta(j - 1)
			continue;
		end
		
		% 交换 B(:, j) 和 B(:, j - 1)
		B(:, [j - 1, j]) = B(:, [j, j - 1]);
		beta([j - 1, j]) = beta([j, j - 1]);
		mu([1:j - 2, j - 1], [j - 1, j]) = mu([1:j - 2, j - 1], [j, j - 1]);
		% j = max(j - 2, 1);
	end
	
	% 通过最后一行求出最短向量
	shortestVector = B(:, end) - round(B(:, end)' * D(:, end) / norm(D(:, end)) ^ 2) * D(:, end);
end
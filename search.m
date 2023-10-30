function y = search(c, w, sk, q, k)
	st = tokgen(sk, w, k);
	t = dot(st, c);
	if t < q / 4
		y = 1;
	else
		y = 0;
	end
end
 
function st = tokgen(sk, w, k)
	[n, m] = size(sk);
	T = rand(n, m); % load(matrix_T.txt);
	M = rand(n, m); % load(matrix_M.txt);
	tau = rand(k);
	for j = 1:k
		T(:, 2 * j - 1:2 * j) = T(:, 2 * j - 1:2 * j);
		T1 = tau(j) * T(:, j) + rand();
	end
	for j = 1:k
		M(:, 2 * j - 1:2 * j) = M(:, 2 * j - 1:2 * j);
		M1 = w(j) * M(:, j) + rand();
	end
	
	% A_tau = [A, mod(T1, q)];
	% e2 = SampleZ(c, s, m / 2);
	% e1 = SamplePre(A_tau, sk, y);
	% st = [e1; e2];
	st = [T; M];
end

function x = SamplePre(A_tau, sk, y)
	x1 = SampleD(sk, c, s);
	x2 = A_tau \ y;
	x = x1 + x2;
end
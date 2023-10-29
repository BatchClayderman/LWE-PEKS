function [pk, sk] = setup(n, m, q, h, id)
	[pk, sk] = TrapGen(n, m, q, h, id);
end

% function [pk, sk] = setup(n, m, m1, m2, q)
% 	[pk, sk] = TrapGen(n, m, q);
% 	A1 = round((q - 1) * rand(n, m));
% 	B = round((q - 1) * rand(n, n));
% 	for i = 1:128
% 		U{i} = round((q - 1) * rand(n, m1));
% 		V{i} = round((q - 1) * rand(n, m2));
% 	end
% end
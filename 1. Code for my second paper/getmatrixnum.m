function [A_matrix]=getmatrixnum(xfix,param)

% L=load('please_send_me_to_wxc_4_17.mat', 'A_char');
% A_char=L.A_char;

A_matrix = [];
for i = 1:size(xfix,2)
    A_m = dFmatnum_mex(1,xfix(:,i),param);
    A_matrix{i} = A_m;
end


% save('A_m1_dwm_01_03.mat','A_matrix')
end
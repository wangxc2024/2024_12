%get_A_m1
clear

A_char = generate_A_char('odeDWM.m')

%load all_x_ss1;
%load A_char;
save('please_send_me_to_wxc_4_17')
% 
% A_matrix = [];
% for i = 1: 4
%     A_m = generate_A_matrix(all_x_ss(i,:),param,A_char);
%     A_matrix{i} = A_m;
% end
% 
% 
% save('A_m1.mat','A_matrix')
% 
% 









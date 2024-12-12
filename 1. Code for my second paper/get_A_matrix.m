load('please_send_me_to_wxc4_17.mat', 'A_char')
load('xss3.mat');
paramDWM;

A_matrix = [];
for i = 1:3
    A_m = generate_A_matrix(all_x_ss(i,:),param,A_char);
    A_matrix{i} = A_m;
end


save('A_m1_dwm_01_03.mat','A_matrix')

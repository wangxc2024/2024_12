function output_A_matrix = generate_A_matrix(input_x_ss,input_param,input_A_char) 
%version: 3.0
%use the A_char as input insteady of run the generate_A_char and save much
%time

fnames = fieldnames(input_param);
for iterator_i = 1:length(fnames)
    eval([fnames{iterator_i} ' = input_param.' fnames{iterator_i} ';']);
end
num = length(input_x_ss);

output_A_matrix = zeros(num,num);
x = input_x_ss';
char_A = input_A_char;
for iterator_i = 1:num
    for iterator_ii = 1:num
        eval(['output_A_matrix(iterator_i,iterator_ii) = ' char_A{iterator_i,iterator_ii} ';']); 
    end
end



end
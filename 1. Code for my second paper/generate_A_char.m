function [output_A_char] = generate_A_char(input_ode_file_name)
%version: 2.0
%add param is matrix
%add the sysble queue
fid = fopen(input_ode_file_name,'r');

dx_zeros = 0;
queue_num = 0;
queue_str = [];
num = 0;
output_parameter_symbols = [];
tline = fgetl(fid);
while ischar(tline)
    tline = fgetl(fid);
    tline(find(isspace(tline))) = [];
    if size(strfind(tline,'param.'),2) > 0
        pos =  strfind(tline,'=');
        if size(strfind(tline,'%['),2) > 0
            pos2 = strfind(tline,'%');
            pos3 = strfind(tline,',');
            tnum1 = str2num(tline(pos2+2:pos3-1));
            tnum2 = str2num(tline(pos3+1:end-1));
            if tnum1 == 1 || tnum2 == 1
                eval([tline(1:pos-1) '=' 'sym(' '''' tline(1:pos-1)  '__%d___'  ''''  ',' tline(pos2+1:end) ');']);
            else
                eval([tline(1:pos-1) '=' 'sym(' '''' tline(1:pos-1)  '__%d___'  '__%d___' ''''  ',' tline(pos2+1:end) ');']);
            end
        else
            eval(['syms ' tline(1:pos-1)]);
        end
        
        
        eval(['output_parameter_symbols = [ output_parameter_symbols reshape(' tline(1:pos-1)   ',1,[]) ];' ]);
        continue;
    end
    if size(strfind(tline,'zeros'),2) > 0;
        p1 = strfind(tline,'(') + 1;
        p2 = strfind(tline,',') - 1;
        num = str2num(tline(p1:p2));
        %persistent x;
        x  = sym('x__%d___',[num 1]);
        %persistent dx;
        dx = sym('dx__%d___',[num 1]);  
        if queue_num > 0
        for i = 1: length(queue_str)
            eval(queue_str{i});    
        end
        end
        dx_zeros = 1;
        continue;
    end
    if size(strfind(tline,'='),2) > 0
        if dx_zeros
%             disp(tline)
            eval(tline);        
            continue;
        else
            queue_num = queue_num + 1;
            queue_str{queue_num} = tline;
        end
    end
    if strcmp(tline,'end') == 1
        break;
    end
end

output_A = cell(num);

for iterator_i = 1:num
    for iterator_ii = 1:num
        
        disp([iterator_i iterator_ii]);
        tic;
        output_A{iterator_i,iterator_ii}(x.',output_parameter_symbols) = diff(dx(iterator_i),x(iterator_ii));
        toc;
    end
end
for iterator_i = 1:num
    for iterator_ii = 1:num
        output_A_char{iterator_i,iterator_ii} = char(output_A{iterator_i,iterator_ii});
    end
end
output_A_char = strrep(output_A_char,'_____',',');
output_A_char = strrep(output_A_char,'___',')');
output_A_char = strrep(output_A_char,'__','(');
fclose(fid);
end

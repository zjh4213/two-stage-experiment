function [  ] = test_theory( experiment_num )
    addpath('../tools');
    svm_para=sprintf('%s','-s 0 -t 0');
    switch experiment_num
        case 1
            load '../input data of two stage experiment/Adult/Adult.mat';
            output_file_dir='../output data of two stage experiment/Adult/';
            step_num = 100;array_num = ( (1:20)*10 ).^2;
        case 2
            load '../input data of two stage experiment/Conect/conect-4.mat';
            output_file_dir='../output data of two stage experiment/Conect/';
            step_num = 100;array_num = ( (1:24)*10 ).^2;
        case 3
            load '../input data of two stage experiment/mushroom/mushroom.mat';
            output_file_dir='../output data of two stage experiment/mushroom/';
            step_num = 100;array_num = ( (1:17)*5 ).^2;
        case 4
            load '../input data of two stage experiment/test_data/dna.mat';
            output_file_dir='../output data of two stage experiment/test_data/';
            step_num = 100;array_num = ( (1:21)*2 ).^2;
        case 5
            load '../input data of two stage experiment/Real Data/realdata2.mat';
            output_file_dir='../output data of two stage experiment/Real Data/';
            step_num = 90;array_num = ( (1:15)*2 ).^2;array_num(16) = 900;
        case 6
            load '../input data of two stage experiment/Real_Data_AAAI_balance/real_data_aaai_balance.mat';
            output_file_dir='../output data of two stage experiment/Real_Data_AAAI_balance/';
            step_num = 100;array_num = ( (1:18)*2 ).^2;
    end
    
    total_repeat_num=100;
    
    n = size(data,1);
    test_num = ceil(0.1*n);
    total_train_num = n - test_num;
    num = floor( sqrt(total_train_num)/20 );
    data = [data ones(n,1)];    
    test_accuracy = zeros(11,size(array_num,2));
    
    for i = 1:11
        probability = (i-1)*0.1;
        for j = 1:size(array_num,2)
            train_num = array_num(j);
            for repeat_num = 1:total_repeat_num
                index = randperm(n);
                data = data(index,:);
                label = label(index,:);

                X = data(1:train_num,:);
                Z = label(1:train_num,:);
                X_test = data(end-test_num+1:end,:);
                label_test = label(end-test_num+1:end,:);
                
                p = rand(train_num,1);
                index = find(p>probability);
                Z(index) = -Z(index);
                
                X_sparse = sparse(X);
                model = train(Z,X_sparse);
                w0= model.w;
                if(model.Label(1,1)~=1)
                    w0=-w0;
                end     

                test_value = X_test*w0';
                test_accuracy(i,j) = test_accuracy(i,j) + sum( test_value.*label_test > 0 )/test_num;                    
            end
        end
        dis_information=sprintf('probability=%f',probability);
        disp(dis_information);
        pause(1)         
    end
    test_accuracy = test_accuracy/total_repeat_num;
    file_name=sprintf('%s%s',output_file_dir,'test_accuracy.mat');
    save(file_name,'test_accuracy','array_num');     
end

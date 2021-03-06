function [] = handle_theory_result(experiment_num)
    switch experiment_num
        case 1
            load '../output data of two stage experiment/Adult/test_accuracy.mat';
            num = 10;title_name = 'Adult';array_num = array_num(2:2:end);test_accuracy = test_accuracy(:,2:2:end);
        case 2
            load '../output data of two stage experiment/Conect/test_accuracy.mat';
            num = 12;title_name = 'Conect';array_num = array_num(2:2:end);test_accuracy = test_accuracy(:,2:2:end);
        case 3
            load '../output data of two stage experiment/mushroom/test_accuracy.mat';
            num = 4;array_num = array_num(2:2:end);test_accuracy = test_accuracy(:,2:2:end);
            title_name = 'mushroom';
        case 4
            load '../output data of two stage experiment/test_data/test_accuracy.mat';
            num = 2;array_num = array_num(2:2:end);test_accuracy = test_accuracy(:,2:2:end);
            title_name = 'DNA';
        case 5
            load '../output data of two stage experiment/Real Data/test_accuracy.mat';
            num = 1;array_num = array_num(2:2:end);test_accuracy = test_accuracy(:,2:2:end);
            title_name = 'Twitter Topic';
        case 6
            load '../output data of two stage experiment/Real_Data_AAAI_balance/test_accuracy.mat';
            num = 1;title_name = 'Twitter NER';array_num = array_num(2:2:end);test_accuracy = test_accuracy(:,2:2:end);
    end 
%     [m,n] = size(test_accuracy);
%     x = (1:n);
%     figure()
%     hold on
%     for i = 1:m
%         plot(x,test_accuracy(i,:));
%     end
%     array_num = 2:2:20;
%     test_accuracy = test_accuracy(:,1:2:end);

    linewidth=1;
    MarkerSize = 6;
    figure();
    hold on
    han(1,1)= plot(array_num, test_accuracy(1,:), ':ok', 'LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(2,1)= plot(array_num, test_accuracy(2,:), '-.xk','LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(3,1)= plot(array_num, test_accuracy(3,:), '--^k','LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(4,1)= plot(array_num, test_accuracy(4,:), '-ok', 'LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(5,1)= plot(array_num, test_accuracy(5,:), ':xk', 'LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(6,1)= plot(array_num, test_accuracy(6,:), '-.^k','LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(7,1)= plot(array_num, test_accuracy(7,:), '--ok','LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(8,1)= plot(array_num, test_accuracy(8,:), '-xk', 'LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(9,1)= plot(array_num, test_accuracy(9,:), ':^k', 'LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);
    han(10,1)=plot(array_num, test_accuracy(10,:),'-.ok','LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize);    
    han(11,1)=plot(array_num, test_accuracy(11,:),'--xk','LineWidth',linewidth,'MarkerFaceColor','w','MarkerSize',MarkerSize); 
    title(title_name,'FontSize',16)
    xlabel('The instance number','FontSize',16);
    ylabel('The test accuracy','FontSize',16); 
    
    
    le1=legend(han(1:5),'p=0.0','p=0.1','p=0.2','p=0.3','p=0.4');
    set(le1,'Box','off','FontSize',12);
    ah=axes('position',get(gca,'position'),'visible','off');
    le2=legend(ah,han(6:11),'p=0.5','p=0.6','p=0.7','p=0.8','p=0.9','p=1.0');
    set(le2,'Box','off','FontSize',12);
 
%     temp=[0 10 100];
%     set(gca,'YTick',log(1+temp)/log(10))
%     set(gca,'YTickLabel',{'0','10','100'})    
%     axis([0 len 0 2.1])                 
    
end

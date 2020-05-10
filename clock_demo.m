%% ��ʼ������
clear all;
close all;
clc;

%% ��ʼ��ʱ��
Hours = 0;
Minutes = 0;
Seconds = 0;

%% ��ѭ��
% ��������
scrsz = get(groot,'ScreenSize');
figure('Name', '�ӱ�',...
        'Position',[1 scrsz(4)/4 scrsz(3)/4 scrsz(4)/2]);
axis([-1.1 1.1 -1.1 1.1]);
axis equal;
axis off;

%% �ļ�·��

while  true
    tic;
    % �������
    clf;
    axis([-1.1 1.1 -1.1 1.1]);
    axis equal;
    axis off;
    
    viscircles([0, 0], 1.04,'Color','black', 'LineWidth', 10);
    % ���ƿ̶�
    for teta = 0:30:360
        point = [0, 1; 0, 0.9]; % ʱ �̶�
        point = my_rotate(point, teta, 0, 0);
        line(point(:, 1), point(:, 2), 'LineWidth', 2.5, 'Color','black');
    end
    num = 1;
    for teta = -30:-30:-360
        point = [0, 0.75; 0, 0.75]; % ʱ ����
        point = my_rotate(point, teta, 0, 0);
        text(point(1, 1), point(1, 2), num2str(num), 'FontSize', 26,...
                                                                         'HorizontalAlignment', 'center');
        num = num + 1;
    end
    for teta = 0:5:360
        point = [0, 1; 0, 0.95]; % �� �̶�
        point = my_rotate(point, teta, 0, 0);
        line(point(:, 1), point(:, 2), 'LineWidth', 1, 'Color','black');
    end
    
    % ����ָ��
    % ��ȡʱ��
    clock_data = clock;
    Hours = clock_data(4);
    Minutes = clock_data(5);
    Seconds = clock_data(6);
    % ���
    viscircles([0, 0], 0.05,'Color','black');
    % ʱ��
    Angle = -30*Hours - Minutes*(30/60);
    point = [0, 0; 0, 0.7] - [0, 0.1; 0, 0.1]; % �� �̶�
    point = my_rotate(point, Angle, 0, 0);
    line(point(:, 1), point(:, 2), 'LineWidth', 8, 'Color','r');
    % ����
    Angle = -Minutes*(360/60) - Seconds*(5/60);
    point = [0, 0; 0, 0.8] - [0, 0.1; 0, 0.1]; % �� �̶�
    point = my_rotate(point, Angle, 0, 0);
    line(point(:, 1), point(:, 2), 'LineWidth', 6, 'Color','g');
    % ����
    Angle = -Seconds*(360/60);
    point = [0, 0; 0, 1.1] - [0, 0.2; 0, 0.2]; % �� �̶�
    point = my_rotate(point, Angle, 0, 0);
    line(point(:, 1), point(:, 2), 'LineWidth', 4, 'Color','b');
    
    viscircles([0, 0], 0.02,'Color','black');
    
    % ���½���
    getframe;

    % �˳��߼�  �����  ���ո��˳�
    if strcmpi(get(gcf, 'CurrentCharacter'), ' ')
        break;
    end
    %break;
    toc;

end



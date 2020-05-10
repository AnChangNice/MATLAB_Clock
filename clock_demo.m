%% 初始化环境
clear all;
close all;
clc;

%% 初始化时间
Hours = 0;
Minutes = 0;
Seconds = 0;

%% 主循环
% 建立窗口
scrsz = get(groot,'ScreenSize');
figure('Name', '钟表',...
        'Position',[1 scrsz(4)/4 scrsz(3)/4 scrsz(4)/2]);
axis([-1.1 1.1 -1.1 1.1]);
axis equal;
axis off;

%% 文件路径

while  true
    tic;
    % 绘制面板
    clf;
    axis([-1.1 1.1 -1.1 1.1]);
    axis equal;
    axis off;
    
    viscircles([0, 0], 1.04,'Color','black', 'LineWidth', 10);
    % 绘制刻度
    for teta = 0:30:360
        point = [0, 1; 0, 0.9]; % 时 刻度
        point = my_rotate(point, teta, 0, 0);
        line(point(:, 1), point(:, 2), 'LineWidth', 2.5, 'Color','black');
    end
    num = 1;
    for teta = -30:-30:-360
        point = [0, 0.75; 0, 0.75]; % 时 数字
        point = my_rotate(point, teta, 0, 0);
        text(point(1, 1), point(1, 2), num2str(num), 'FontSize', 26,...
                                                                         'HorizontalAlignment', 'center');
        num = num + 1;
    end
    for teta = 0:5:360
        point = [0, 1; 0, 0.95]; % 刻 刻度
        point = my_rotate(point, teta, 0, 0);
        line(point(:, 1), point(:, 2), 'LineWidth', 1, 'Color','black');
    end
    
    % 绘制指针
    % 获取时间
    clock_data = clock;
    Hours = clock_data(4);
    Minutes = clock_data(5);
    Seconds = clock_data(6);
    % 轴承
    viscircles([0, 0], 0.05,'Color','black');
    % 时针
    Angle = -30*Hours - Minutes*(30/60);
    point = [0, 0; 0, 0.7] - [0, 0.1; 0, 0.1]; % 刻 刻度
    point = my_rotate(point, Angle, 0, 0);
    line(point(:, 1), point(:, 2), 'LineWidth', 8, 'Color','r');
    % 分针
    Angle = -Minutes*(360/60) - Seconds*(5/60);
    point = [0, 0; 0, 0.8] - [0, 0.1; 0, 0.1]; % 刻 刻度
    point = my_rotate(point, Angle, 0, 0);
    line(point(:, 1), point(:, 2), 'LineWidth', 6, 'Color','g');
    % 秒针
    Angle = -Seconds*(360/60);
    point = [0, 0; 0, 1.1] - [0, 0.2; 0, 0.2]; % 刻 刻度
    point = my_rotate(point, Angle, 0, 0);
    line(point(:, 1), point(:, 2), 'LineWidth', 4, 'Color','b');
    
    viscircles([0, 0], 0.02,'Color','black');
    
    % 更新界面
    getframe;

    % 退出逻辑  激活窗体  按空格退出
    if strcmpi(get(gcf, 'CurrentCharacter'), ' ')
        break;
    end
    %break;
    toc;

end



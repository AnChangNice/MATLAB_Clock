clc;
% 获取当前路径
filepath = pwd;

for num=1:60
    im=imread([filepath, '\输出图像\带水印\', num2str(num), '.jpg']);
    [I, map]=rgb2ind(im, 20); 
    if num==1
       %imwrite(I,map,'112233/GIF/meow5.gif','gif', 'Loopcount',inf,'DelayTime',0.2);%FIRST
        imwrite(I,map,[filepath, '\输出图像\GIF\ClockGIF.gif'],'gif', 'Loopcount',inf,'DelayTime',0.05);%FIRST
    else
       %imwrite(I,map,'112233/GIF/meow5.gif','gif','WriteMode','append','DelayTime',0.2);
       imwrite(I,map,[filepath, '\输出图像\GIF\ClockGIF.gif'],'gif', 'WriteMode','append','DelayTime',0.05);
    end
end

clear all;

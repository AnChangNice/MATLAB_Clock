clc;
% ��ȡ��ǰ·��
filepath = pwd;

for num=1:60
    im=imread([filepath, '\���ͼ��\��ˮӡ\', num2str(num), '.jpg']);
    [I, map]=rgb2ind(im, 20); 
    if num==1
       %imwrite(I,map,'112233/GIF/meow5.gif','gif', 'Loopcount',inf,'DelayTime',0.2);%FIRST
        imwrite(I,map,[filepath, '\���ͼ��\GIF\ClockGIF.gif'],'gif', 'Loopcount',inf,'DelayTime',0.05);%FIRST
    else
       %imwrite(I,map,'112233/GIF/meow5.gif','gif','WriteMode','append','DelayTime',0.2);
       imwrite(I,map,[filepath, '\���ͼ��\GIF\ClockGIF.gif'],'gif', 'WriteMode','append','DelayTime',0.05);
    end
end

clear all;

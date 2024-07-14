L=imread('lena.bmp');
L=imresize(L, [256, 256]); % 调整图片大小
[height,width]=size(L); % 获取原图像大小
width=width/3; % 排除颜色通道数
for t=1:3
    for i=1: height
        for j=1: width
            if L(i,j,t)>127
                out=255;
            else
                out=0;
            end
            error=L(i,j)-out;
            if j>1 && i<height && j<width
                L(i,j+1,t)=L(i,j+1,t)+error*7/16.0;
                L(i+1,j,t)=L(i+1,j,t)+error*5/16.0;
                L(i+1,j-1,t)=L(i+1,j-1,t)+error*3/16.0;
                L(i+1,j+1,t)=L(i+1,j+1,t)+error*1/16.0;
                L(i,j,t)=out;
            else
                L(i,j,t)=out;
            end
        end
    end
end
figure(1);
imshow(L);title('半色调处理');
imwrite(L,'.\test3\半色调处理后的图片.png','png');
red=L(:,:,1);
green=L(:,:,2);
blue=L(:,:,3);
sub_height=2*height;sub_width=2*width;
A=zeros(sub_height,sub_width);
B=zeros(sub_height,sub_width);
for t=1:3
    for i=1: height
        for j=1: width
            if(L(i,j,t)==255)
                random= round(rand()*3);
                switch random
                    case 0
                        A(2*i-1,2*j-1,t)=1;A(2*i-1,2*j,t)=1;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=0;
                        B(2*i-1,2*j-1,t)=0;B(2*i-1,2*j,t)=1;B(2*i,2*j-1,t)=0;B(2*i,2*j,t)=1;
                    case 1
                        A(2*i-1,2*j-1,t)=1;A(2*i-1,2*j,t)=1;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=0;
                        B(2*i-1,2*j-1,t)=0;B(2*i-1,2*j,t)=1;B(2*i,2*j-1,t)=0;B(2*i,2*j,t)=0;
                    case 2
                        A(2*i-1,2*j-1,t)=0;A(2*i-1,2*j,t)=1;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=0;
                        B(2*i-1,2*j-1,t)=1;B(2*i-1,2*j,t)=1;B(2*i,2*j-1,t)=0;B(2*i,2*j,t)=0;
                    case 3
                        A(2*i-1,2*j-1,t)=0;A(2*i-1,2*j,t)=1;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=0;
                        B(2*i-1,2*j-1,t)=0;B(2*i-1,2*j,t)=1;B(2*i,2*j-1,t)=0;B(2*i,2*j,t)=0;
                end
            end
            if(L(i,j,t)==0)
                random= round(rand()*3);
                switch random
                    case 0
                        A(2*i-1,2*j-1,t)=1;A(2*i-1,2*j,t)=1;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=0;
                        B(2*i-1,2*j-1,t)=0;B(2*i-1,2*j,t)=0;B(2*i,2*j-1,t)=1;B(2*i,2*j,t)=1;
                    case 1
                        A(2*i-1,2*j-1,t)=1;A(2*i-1,2*j,t)=1;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=0;
                        B(2*i-1,2*j-1,t)=0;B(2*i-1,2*j,t)=0;B(2*i,2*j-1,t)=0;B(2*i,2*j,t)=1;
                    case 2
                        A(2*i-1,2*j-1,t)=0;A(2*i-1,2*j,t)=0;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=1;
                        B(2*i-1,2*j-1,t)=1;B(2*i-1,2*j,t)=1;B(2*i,2*j-1,t)=0;B(2*i,2*j,t)=0;
                    case 3
                        A(2*i-1,2*j-1,t)=1;A(2*i-1,2*j,t)=0;A(2*i,2*j-1,t)=0;A(2*i,2*j,t)=0;
                        B(2*i-1,2*j-1,t)=0;B(2*i-1,2*j,t)=0;B(2*i,2*j-1,t)=0;B(2*i,2*j,t)=1;
                end
            end
        end
    end
end
figure(2);
imshow(A);title('子图1');
imwrite(A,'.\test3\subkey1.png','png');
figure(5);
imshow(B);title('子图2');
imwrite(B,'.\test3\subkey2.png','png');
overlap=zeros(2*height,2*width);
for t=1:3
    overlap(:,:,t)=and(A(:,:,t),B(:,:,t));
end
figure(3);
imshow(overlap);title('合并后的图片');
imwrite(overlap,'.\test3\合并后的图片.png','png');
minipic=zeros(height,width);
for t=1:3
    for i=1: height
        for j=1: width
            if(overlap(2*i-1,2*j-1,t)==1||overlap(2*i-1,2*j,t)==1||overlap(2*i,2*j-1,t)==1||overlap(2*i,2*j,t)==1)
                minipic(i,j,t)=1;
            else
                minipic(i,j,t)=0;
            end
        end
    end
end
figure(4);
imshow(minipic);title('缩小处理后的复原图');
imwrite(minipic,'.\test3\缩小处理后的复原图.png','png');
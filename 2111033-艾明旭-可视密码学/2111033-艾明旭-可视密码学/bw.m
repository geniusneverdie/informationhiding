x=imread('.\lena.bmp'); % 读取图片
y=imresize(x, [256, 256]); % 调整图片大小
I=rgb2gray(y); % 将图片转换为灰度图
a=imbinarize(I); % 将灰度图二值化
figure(1); % 创建图形窗口
imshow(x);title('原始图片'); % 显示原始图片
imwrite(x,'.\test1\原始图片.png','png');
figure(2); % 创建另一个图形窗口
imshow(y);title('调整大小后的图片'); % 显示调整大小后的图片
imwrite(y,'.\test1\调整大小后的图片.png','png');
figure(3); % 创建另一个图形窗口
imshow(a);title('二值化后的图片'); % 显示二值化后的图片
imwrite(a,'.\test1\二值化后的图片.png','png');
A=zeros(512,512); % 创建一个全零矩阵A
B=zeros(512,512); % 创建一个全零矩阵B
[height,width]=size(a); % 获取二值化图片的尺寸
for i=1: height % 遍历图片的每一行
    for j=1: width % 遍历图片的每一列
        if(a(i,j)==1) % 如果当前像素是白色的
            random=rand()*4; % 生成一个0到4的随机数
            % 根据随机数的范围，对矩阵A和B进行不同的赋值操作
            if(random>0&&random<=1)
                A(2*i-1,2*j-1)=1;A(2*i-1,2*j)=1;A(2*i,2*j-1)=0;A(2*i,2*j)=0;
                B(2*i-1,2*j-1)=0;B(2*i-1,2*j)=1;B(2*i,2*j-1)=0;B(2*i,2*j)=1;
            end
            if(random>1&&random<=2)
                A(2*i-1,2*j-1)=1;A(2*i-1,2*j)=1;A(2*i,2*j-1)=0;A(2*i,2*j)=0;
                B(2*i-1,2*j-1)=0;B(2*i-1,2*j)=1;B(2*i,2*j-1)=0;B(2*i,2*j)=0;
            end
            if(random>2&&random<3)
                A(2*i-1,2*j-1)=0;A(2*i-1,2*j)=1;A(2*i,2*j-1)=0;A(2*i,2*j)=0;
                B(2*i-1,2*j-1)=1;B(2*i-1,2*j)=1;B(2*i,2*j-1)=0;B(2*i,2*j)=0;
            end
            if(random>3&&random<=4)
                A(2*i-1,2*j-1)=0;A(2*i-1,2*j)=1;A(2*i,2*j-1)=0;A(2*i,2*j)=0;
                B(2*i-1,2*j-1)=0;B(2*i-1,2*j)=1;B(2*i,2*j-1)=0;B(2*i,2*j)=0;
            end
        end
        if(a(i,j)==0) % 如果当前像素是黑色的
            random=rand()*4; % 生成一个0到4的随机数
            % 根据随机数的范围，对矩阵A和B进行不同的赋值操作
            if(random>0&&random<=1)
                A(2*i-1,2*j-1)=1;A(2*i-1,2*j)=1;A(2*i,2*j-1)=0;A(2*i,2*j)=0;
                B(2*i-1,2*j-1)=0;B(2*i-1,2*j)=0;B(2*i,2*j-1)=1;B(2*i,2*j)=1;
            end
            if(random>1&&random<=2)
                A(2*i-1,2*j-1)=1;A(2*i-1,2*j)=1;A(2*i,2*j-1)=0;A(2*i,2*j)=0;
                B(2*i-1,2*j-1)=0;B(2*i-1,2*j)=0;B(2*i,2*j-1)=0;B(2*i,2*j)=1;
            end
            if(random>2&&random<=3)
                A(2*i-1,2*j-1)=0;A(2*i-1,2*j)=0;A(2*i,2*j-1)=0;A(2*i,2*j)=1;
                B(2*i-1,2*j-1)=1;B(2*i-1,2*j)=1;B(2*i,2*j-1)=0;B(2*i,2*j)=0;
            end
            if(random>3&&random<=4)
                A(2*i-1,2*j-1)=1;A(2*i-1,2*j)=0;A(2*i,2*j-1)=0;A(2*i,2*j)=0;
                B(2*i-1,2*j-1)=0;B(2*i-1,2*j)=0;B(2*i,2*j-1)=0;B(2*i,2*j)=1;
            end
        end
    end
end
imwrite(A,'.\test1\subkey1.png','png'); % 将矩阵A保存为图片
imwrite(B,'.\test1\subkey2.png','png'); % 将矩阵B保存为图片
figure(4); % 创建图形窗口
imshow(A);title('子密钥1'); % 显示子密钥1
figure(5); % 创建另一个图形窗口
imshow(B);title('子密钥2'); % 显示子密钥2
I=and(A,B); % 对矩阵A和B进行逻辑或操作
figure(6); % 创建另一个图形窗口
imshow(I);title('合并后的四倍大小的中等灰度原图'); % 显示合并后的图片
imwrite(I,'.\test1\合并后的四倍大小的中等灰度原图.png','png');
C=zeros(256,256); % 创建一个全一矩阵C
for i=1:height % 遍历图片的每一行
    for j=1:width % 遍历图片的每一列
        if((I(2*i-1,2*j-1)==1)||(I(2*i-1,2*j)==1)||(I(2*i,2*j-1)==1)||(I(2*i,2*j)==1))
            C(i,j)=1; % 如果合并后的图片中有白色像素，则将C中对应位置设为1
        end
    end
end
figure(7); % 创建图形窗口
imshow(C);title('经过缩放得到的原图'); % 显示经过处理后得到的原图
imwrite(C,'.\test1\经过缩放得到的原图.png','png');

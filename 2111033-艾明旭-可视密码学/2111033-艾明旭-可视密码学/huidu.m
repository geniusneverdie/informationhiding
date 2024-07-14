input_img = imread('lena.bmp'); % 读取图片
input_img = imresize(input_img, [256, 256]); % 调整图片大小为256x256
im = rgb2gray(input_img); % 将图片转换为灰度图
% 半色调化处理
K = im;
I = zeros(size(K)); % 创建与K相同大小的零矩阵
[height,width]=size(K); % 获取图片的高度和宽度
a = 7/16; % 定义误差扩散系数
b = 3/16;
c = 5/16;
d = 1/16;
for i = 1:width % 遍历每一列
    for j = 1:height % 遍历每一行
        if K(i,j) > 127 % 判断像素值是否大于127
            I(i,j) = 255; % 将像素值设为255（白色）
        else
            I(i,j) = 0; % 将像素值设为0（黑色）
        end
        error = (K(i,j) - I(i,j)); % 计算误差
        % 误差扩散
        if j > 1 && j < height && i < width
            K(i,j+1) = K(i,j+1) + error * a;
            K(i+1,j-1) = K(i+1,j-1) + error * b;
            K(i+1,j) = K(i+1,j) + error * c;
            K(i+1,j+1) = K(i+1,j+1) + error * d;
        end
    end
end
% 二值化处理
im_bin = imbinarize(im); % 将灰度图转换为二值图
% 显示输出图像
figure(1);
subplot(1,2,1);imshow(I);title("半色调化处理的图像");
imwrite(I,'.\test2\半色调化处理的图像.png','png'); % 保存半色调化处理的图像
subplot(1,2,2);imshow(im_bin);title("二值化处理的图像");
imwrite(im_bin,'.\test2\二值化处理的图像.png','png'); % 保存二值化处理的图像
A=zeros(512,512); % 创建一个全零矩阵A
B=zeros(512,512); % 创建一个全零矩阵B
[height,width]=size(I); % 获取二值化图片的尺寸
for i=1: height % 遍历图片的每一行
    for j=1: width % 遍历图片的每一列
        if(I(i,j)==255) % 如果当前像素是白色的
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
        if(I(i,j)==0) % 如果当前像素是黑色的
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
imwrite(A,'.\test2\subkey1.png','png'); % 将矩阵A保存为图片
imwrite(B,'.\test2\subkey2.png','png'); % 将矩阵B保存为图片
figure(4); % 创建图形窗口
imshow(A);title('子密钥1'); % 显示子密钥1
figure(5); % 创建另一个图形窗口
imshow(B);title('子密钥2'); % 显示子密钥2
I=and(A,B); % 对矩阵A和B进行逻辑与操作
figure(6); % 创建另一个图形窗口
imshow(I);title('合并后的四倍大小的中等灰度原图'); % 显示合并后的图片
imwrite(I,'.\test2\合并后的四倍大小的中等灰度原图.png','png');
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
imwrite(C,'.\test2\经过缩放得到的原图.png','png');
input_img = imread('lena.bmp'); % 读取图片
input_img = imresize(input_img, [256, 256]); % 调整图片大小为256x256
im = rgb2gray(input_img); % 将图片转换为灰度图
% 半色调化处理
K = im;
I = zeros(size(K)); % 创建与K相同大小的零矩阵
[height,width]=size(K); % 获取图片的高度和宽度
a = 7/16; % 定义误差扩散系数
b = 3/16;
c = 5/16;
d = 1/16;
for i = 1:width % 遍历每一列
    for j = 1:height % 遍历每一行
        if K(i,j) > 127 % 判断像素值是否大于127
            I(i,j) = 255; % 将像素值设为255（白色）
        else
            I(i,j) = 0; % 将像素值设为0（黑色）
        end
        error = (K(i,j) - I(i,j)); % 计算误差
        % 误差扩散
        if j > 1 && j < height && i < width
            K(i,j+1) = K(i,j+1) + error * a;
            K(i+1,j-1) = K(i+1,j-1) + error * b;
            K(i+1,j) = K(i+1,j) + error * c;
            K(i+1,j+1) = K(i+1,j+1) + error * d;
        end
    end
end
% 二值化处理
im_bin = imbinarize(im); % 将灰度图转换为二值图
% 显示输出图像
figure(1);
subplot(1,2,1);imshow(I);title("半色调化处理的图像");
imwrite(I,'.\test2\半色调化处理的图像.png','png'); % 保存半色调化处理的图像
subplot(1,2,2);imshow(im_bin);title("二值化处理的图像");
imwrite(im_bin,'.\test2\二值化处理的图像.png','png'); % 保存二值化处理的图像
A=zeros(512,512); % 创建一个全零矩阵A
B=zeros(512,512); % 创建一个全零矩阵B
[height,width]=size(I); % 获取二值化图片的尺寸
for i=1: height % 遍历图片的每一行
    for j=1: width % 遍历图片的每一列
        if(I(i,j)==255) % 如果当前像素是白色的
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
        if(I(i,j)==0) % 如果当前像素是黑色的
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
imwrite(A,'.\test2\subkey1.png','png'); % 将矩阵A保存为图片
imwrite(B,'.\test2\subkey2.png','png'); % 将矩阵B保存为图片
figure(4); % 创建图形窗口
imshow(A);title('子密钥1'); % 显示子密钥1
figure(5); % 创建另一个图形窗口
imshow(B);title('子密钥2'); % 显示子密钥2
I=and(A,B); % 对矩阵A和B进行逻辑与操作
figure(6); % 创建另一个图形窗口
imshow(I);title('合并后的四倍大小的中等灰度原图'); % 显示合并后的图片
imwrite(I,'.\test2\合并后的四倍大小的中等灰度原图.png','png');
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
imwrite(C,'.\test2\经过缩放得到的原图.png','png');

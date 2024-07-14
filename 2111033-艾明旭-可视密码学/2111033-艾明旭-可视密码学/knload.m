% 读取图像
path = 'lena.bmp';
img = imread(path);
img_gray = rgb2gray(img);
img_flattened = img_gray(:);
% disp(img_flattened);

% 多项式生成
n = 5;
r = 3;
gen_imgs = polynomial(img_flattened, n, r);

% 保存生成的图像
for i = 1:n
    img_save = reshape(gen_imgs(i,:), size(img_gray));
    imwrite(uint8(img_save), strcat('test2_', num2str(i), '.jpeg'));
end

% 解码
index = 1:r;
origin_img = decode(gen_imgs(1:r,:), index, r, n);
imwrite(uint8(reshape(origin_img, size(img_gray))), 'test2_origin.jpeg');

% 多项式生成函数
function gen_imgs = polynomial(img, n, r)
    % 获取图像中像素的数量
    num_pixels = size(img, 1);
    % disp(num_pixels);

    % 随机生成多项式的系数矩阵，范围在 [0, 251)
    coef = randi([0, 250], num_pixels, r - 1);
    % disp(coef);

    % 存储生成的图像序列
    gen_imgs = zeros(n, num_pixels);

    % 对于每个要生成的多项式
    for i = 1:n
        % 构建基向量 [i^1, i^2, ..., i^(r-1)]
        base = zeros(1, r - 1); % 初始化基函数数组
        for j = 1:r - 1
            base(j) = i^j; % 计算每个指数值并存储到数组中
        end
        % 计算每个像素点对应的基函数值，并将其加到原始图像数据上
        base = coef * base';
        img = double(img);
        img_ = img + mod(base, 251);

        % 对结果取模，确保像素值在合理范围内
        img_ = mod(img_, 251);

        % 将处理后的图像存储到生成的图像序列中
        gen_imgs(i, :) = img_';
    end
end


% 解码函数
function origin_img = decode(imgs, index, r, ~)
    assert(size(imgs, 1) >= r);
    dim = size(imgs, 2);
    origin_img = zeros(1, dim);

    for i = 1:dim
        if mod(i, 10000) == 0
            disp(['Decoding ', num2str(i), 'th pixel']);
        end
        y = imgs(:, i)';
        pixel = mod(lagrange(index,y,0), 251);
        origin_img(i) = pixel;
    end
end


   function DCT_full()


   img = imread('lion.jpg');
   [p,q] = size(img(:,:,1));
   p = floor(p/8)*8; 
   q = floor(q/8)*8;

   A = rgb2gray(img);

   figure();
   imagesc(A); 
   title('original'); 
   colormap(gray);
   
   % quantization matrix
   Q = [16  11  10  16  24  40  51  61; ...
        12  12  14  19  26  58  60  55; ...
        14  13  16  24  40  57  69  56; ...
        14  17  22  29  51  87  80  62; ...
        18  22  37  56  68 109 103  77; ...
        24  35  55  64  81 104 113  92; ...
        49  64  78  87 103 121 120 101; ...
        72  92  95  98 112 100 103  99];

   Y = zeros(p,q);

   % loop over 8x8 blocks
   for blockx = 1:p/8
   for blocky = 1:q/8
      block = double(A(blockx*8-7:blockx*8, blocky*8-7:blocky*8))-128; % get block, and shift it
      block = dct2(block);                             % discrete cosine transform
      block = round(block ./ Q);                       % quantization
      Y(blockx*8-7:blockx*8, blocky*8-7:blocky*8) = block;
   end
   end
   figure();
   imagesc(Y);
   title('DCT of image');
   colormap(gray);

   
   A = uint8(zeros(p,q));

   % reconstruct Y channel
   for blockx = 1:p/8
   for blocky = 1:q/8
      block = Y(blockx*8-7:blockx*8, blocky*8-7:blocky*8); % get block
      block = block.*Q;                               % dequantization
      block = idct2(block);                           % inverse discrete cosine transform
      block = uint8(block + 128);                     % shift
      A(blockx*8-7:blockx*8, blocky*8-7:blocky*8) = block;
   end
   end

   figure();
   imagesc(A); 
   title('reconstructed image'); 
   colormap(gray);
   end

  
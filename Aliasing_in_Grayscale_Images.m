Z = imread('Lena.jpg');


% Findin g DFT
DFT = log(abs(fftshift(fft2(Z)))) ;
%I n t e n s i t y pl o t o f DFT
imtool(DFT) ;
figure(1)
imshow(Z) ;
% C al c ul a ti n g DFT
DFT = log(abs(fftshift(fft2(Z)))) ;
% I n t e n s i t y pl o t o f DFT
imtool(DFT) ;
% P e r s p e c ti v e pl o t o f DFT
figure(2);
mesh(DFT) ; colormap hot;

OverSampled = Z(1:2:256,1:2:256 ) ;
class_of_I = class(OverSampled);
[x1 y1] = meshgrid(1:2:256);
[x1i y1i] = meshgrid(1:1:256);

OverSampled_DFT = log(abs(fftshift(fft2(OverSampled)))) ;
Recons_From_OverSampled = cast(interp2(x1,y1,double(OverSampled),x1i,y1i,'linear'),class_of_I);
%Recons_From_OverSampled = griddedInterpolant(X1,double(OverSampled)) ;
figure(3);
subplot(3,3,1);imshow(OverSampled) ;
xlabel('OverSampled') ;
subplot(3,3,2) ; imshow ( OverSampled_DFT , [ ] ) ;
xlabel('OverSampled Spectrum') ;
subplot(3 , 3 , 3 ) ; imshow ( Recons_From_OverSampled ) ;
xlabel('Reconstruction from Oversampled' ) ;

fu=6;
UnderSampled = Z(1:fu:256,1:fu:256 ) ;
class_of_E = class(UnderSampled);
[x1 y1] = meshgrid(1:fu:256);
[x1i y1i] = meshgrid(1:1:256);
UnderSampled_DFT = log(abs(fftshift(fft2(UnderSampled)))) ;
Recons_From_UnderSampled = cast(interp2(x1,y1,double(UnderSampled),x1i,y1i,'linear'),class_of_E);
%Recons_From_UnderSampled = interp2(UnderSampled,5) ;
subplot(3,3,4);imshow(UnderSampled) ;
xlabel('UndeSampled') ;
subplot(3,3,5) ; imshow ( UnderSampled_DFT , [ ] ) ;
xlabel('UnderSampled Spectrum') ;
subplot(3 , 3 , 6 ) ; imshow ( Recons_From_UnderSampled ) ;
xlabel('Reconstruction from Undersampled' ) ;

Znf = imresize(Z,0.16667,'Antialiasing',false);
subplot(3 , 3 , 7 ) ; imshow ( Znf ) ;
xlabel('without Anti-aliasing' ) ;

Zf = imresize(Z,0.16667,'Antialiasing',true);
subplot(3 , 3 , 8 ) ; imshow ( Zf ) ;
xlabel('with Anti-aliasing filter' ) ;

class_of_E = class(Zf);
[x1 y1] = meshgrid(1:fu:256);
[x1i y1i] = meshgrid(1:1:256);
Zf_DFT = log(abs(fftshift(fft2(Zf)))) ;
Recons_From_Zf = cast(interp2(x1,y1,double(Zf),x1i,y1i,'linear'),class_of_E);
subplot(3 , 3 , 9 ) ; imshow ( Recons_From_Zf ) ;
xlabel('Reconstruction from antialiasing' ) ;



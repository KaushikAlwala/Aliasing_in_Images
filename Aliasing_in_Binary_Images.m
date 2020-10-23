%Creating a 2D sine wave(Binary_Image)
A = 5 ; % Amplitude o f the inpu t
Fx = 10; % f r e q u e n c y x o f one component o f in pu t
Fy = 10; % f r e q u e n c y y o f o t h e r component o f inpu t
phi = 0 ; % the phase o f the s i g n a l
NumberOfSamples = 256; % t o t a l no o f s ample s o f my inp u t
StepSize = 1/NumberOfSamples ; % something f o r the p l o t t i n g
x = 0 : StepSize:1-StepSize ; % 256 x v al u e s from 0 t o 1 i n s t e p s o f 1/256
y = 0 : StepSize:1-StepSize ; % 256 y v al u e s from 0 t o 1 i n s t e p s o f 1/256

[X,Y] = meshgrid( x , y ) ; % t h i s i s our x?y pl o t enviornment

Z = A*sin(2* pi*Fx*X + 2*pi*Fy*Y +phi ) ; % t h i s i s our inpu t s i g n a l

% Findin g DFT
DFT = log(abs(fftshift(fft2(Z)))) ;
%I n t e n s i t y pl o t o f DFT
imtool(DFT) ;
figure(1);
imshow(Z) ;
% C al c ul a ti n g DFT
DFT = log(abs(fftshift(fft2(Z)))) ;
% I n t e n s i t y pl o t o f DFT
imtool(DFT) ;
% P e r s p e c ti v e pl o t o f DFT
figure(2);
mesh(DFT) ; colormap hot;

%Converting the frequency into sampling rate
NoOfSamples =256;
Step = 1/ NoOfSamples ;
fmax=10;
fnyquist=2*fmax ;
Tnyquist = 1/fnyquist ;
Nyquist_sampling_rate = Tnyquist/Step


OverSampled = Z(1:4:256,1:4:256 ) ;
OverSampled_DFT = log(abs(fftshift(fft2(OverSampled)))) ;
Recons_From_OverSampled = interp2(OverSampled,5) ;
figure(3);
subplot(3,3,4);imshow(OverSampled) ;
xlabel('OverSampled') ;
subplot(3,3,5) ; imshow ( OverSampled_DFT , [ ] ) ;
xlabel('OverSampled Spectrum') ;
subplot(3 , 3 , 6 ) ; imshow ( Recons_From_OverSampled ) ;
xlabel('Reconstruction from Oversampled' ) ;

UnderSampled = Z(1:15:256,1:15:256 ) ;
UnderSampled_DFT = log(abs(fftshift(fft2(UnderSampled)))) ;
Recons_From_UnderSampled = interp2(UnderSampled,5) ;
subplot(3,3,7);imshow(UnderSampled) ;
xlabel('UndeSampled') ;
subplot(3,3,8) ; imshow ( UnderSampled_DFT , [ ] ) ;
xlabel('UnderSampled Spectrum') ;
subplot(3 , 3 , 9 ) ; imshow ( Recons_From_UnderSampled ) ;
xlabel('Reconstruction from Undersampled' ) ;

subplot(3,3,2);imshow(Z) ;
xlabel('Original') ;


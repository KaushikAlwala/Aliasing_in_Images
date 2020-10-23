# Aliasing_in_Images
The MATLAB code given is used for demonstrating aliasing effects in the Images.
Demonstration of Image Aliasing using Matlab: 
Case 1: Binary image
A two-dimensional sine wave is created by the equation A*sin(2*pi*Fx*x + 2*pi*Fy*y) where A-amplitude, Fx, Fy are the frequencies in x and y directions respectively, x and y vary from 1 to 256 each, thus generating a 2d sine wave image.
Step1: After the image is generated, to know the highest frequency DFT is done on the image and using a Matlab function we were able to visualize it with the help of a 3D graph.
There were two peaks which occurred at (119,119) and (139,139). So the frequencies of these peaks are (-10,-10) and (10,10).

After obtaining the highest frequency as 10, we know that the Nyquist frequency is 20. The Nyquist rate is obtained as 12.8 which can be taken as 13 in both X and Y directions. So if we take one sample in every 13 pixels in both directions we can observe aliasing for this case.
  
Step2:
Above the Nyquist rate(OverSampled): For this case, we took one sample in every 4 pixels and then reconstructed back using “interp2”.
Below the Nyquist rate(UnderSampled):  For this case, we took one sample in every 15 pixels and then reconstructed back using “interp2”.

Case 2: Gray Scale Image
A 256x256 grayscale image is taken for this purpose.
Step1: After the image is generated, to know the highest frequency DFT is done on the image and using a Matlab function we were able to visualize it with the help of a 3D graph.
This image’s  DFT doesn’t tell the exact band limit, but we can see the border where the high frequencies don’t contribute much.
After some rough calculations, we came to the conclusion that the Nyquist rate is around 4 samples/pixels in both directions, i.e. one sample in every 4 pixels in both directions.

Step2:
Above the Nyquist rate(OverSampled): For this case, we took one sample in every 2 pixels and then reconstructed back using “interp2”.
Below the Nyquist rate(UnderSampled):  For this case, we took one sample in every 6 pixels and then reconstructed back using “interp2”.

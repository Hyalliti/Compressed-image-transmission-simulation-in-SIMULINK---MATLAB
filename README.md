# Compressed-image-transmission-simulation-in-SIMULINK---MATLAB
I've uploaded the attempts files and the successful files, please do not copy any of the code without 
permission or you won't get bragging rights when you're done.  

Project Background : 
After being handed the option of an image transmission project as a classroom final project for digital
communications, i chose it instead of boring voice-call transmissions, i decided to make use of Matlab 
and Simulink to smooth the transition from code to block diagrams. The main idea was to transmit
a coloured image in a noisy AWGN (Additive white gaussian noise) channel through long distances.  

The first attempts were terribly unsuccessful due to the low rate , the big image couldn't be 
transferred properly, resizing wouldn't fix much of the problem and there wasn't enough resilience to noise. 
So i went in to add encoding, which in itself might not be hard to understand but it was hard to me back then, 
understanding the differential encoding AND it's interaction in image transfer which is considered 
to be a high bitrate transfer.  After seeing the project burn in a 51% completeness of the received 
image in regards to the actual full colored image due to: 
- the low bitrate . 
- low resiliency to noise because of the size of the image.

It ocurred to me to use SVD (Singular Value Decomposition), which i had learned previously on my 
Machine Learning course and made use of eigenvalues to reduce the size of the image without sacrificing 
how recognizable to the human eye the image was. tldr: SVD = no recognizable loss in quality but considerable 
decrease in size.  

So... it worked, and i could transfer images km upon km, 
if i don't misrecall it was about 10km. I'd say that was pretty good.

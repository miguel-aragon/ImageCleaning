# ImageCleaning

## Description

This is a simple brute force anisotropic adaptive image filter. The results are similar to wavelet filtering. The algorithm is based on montecarlo sampling an image and constructing an image from the Delaunay tessellation of the sampled points. This is done on each channel independently. The trick to avoid ugly Delaunay artifacts is to create an ensemble of Montecarlo samplings and add them at the end.

The method works surprisingly good. On the left the original images. Note the strong jpeg artifacts. On the right the cleaned images. Note the lack of jpeg artifacts, and the smoothing in the dark regions.

![picture](Images/Gal_010.jpg) ![picture](Images/Gal_010.png)

![picture](Images/Gal_046.jpg) ![picture](Images/Gal_046.png)

![picture](Images/Gal_067.jpg) ![picture](Images/Gal_067.png)

![picture](Images/Gal_094.jpg) ![picture](Images/Gal_094.png)

![picture](Images/Gal_096.jpg) ![picture](Images/Gal_096.png)


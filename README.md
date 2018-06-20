# ImageCleaning

## Description

This is a simple brute force anisotropic adaptive image filter. The results are similar to wavelet filtering. The algorithm is based on montecarlo sampling an image and constructing an image from the Delaunay tessellation of the sampled points. This is done on each channel independently. The trick to avoid ugly Delaunay artifacts is to create an ensemble of Montecarlo samplings and add them at the end.


![picture](images/Gal_010.jpg)
![picture](images/Gal_010.png)

![picture](images/Gal_046.jpg)
![picture](images/Gal_046.png)

![picture](images/Gal_067.jpg)
![picture](images/Gal_067.png)

![picture](images/Gal_094.jpg)
![picture](images/Gal_094.png)

![picture](images/Gal_096.jpg)
![picture](images/Gal_096.png)


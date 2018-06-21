;
;
;
;
;

FOR www=0L, 349 DO BEGIN

read_jpeg, 'Imas/Gal_'+format_number(www,3)+'.jpg', ori
ori = ori/256.0

cln = read_png('Clean/Gal_'+format_number(www,3)+'.png')
cln = cln/256.0

cln2 = fltarr(3,256,256)
cln2[0,*,*] = average_downsample(reform(cln[0,*,*]))
cln2[1,*,*] = average_downsample(reform(cln[1,*,*]))
cln2[2,*,*] = average_downsample(reform(cln[2,*,*]))


cln3 = fltarr(3,256,256)
FOR j=0L, 255 DO BEGIN
   FOR i=0L, 255 DO BEGIN

      cln3[0,i,j] = ori[0,i,j]*ori[0,i,j] + cln2[0,i,j]*(1.0-ori[0,i,j])
      cln3[1,i,j] = ori[1,i,j]*ori[1,i,j] + cln2[1,i,j]*(1.0-ori[1,i,j])
      cln3[2,i,j] = ori[2,i,j]*ori[2,i,j] + cln2[2,i,j]*(1.0-ori[2,i,j])

   ENDFOR
ENDFOR

write_png, 'Mix/Gal_'+format_number(www,3)+'.png', bytscl(cln3)

ENDFOR


end

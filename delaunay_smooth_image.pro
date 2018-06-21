;
;
;
;

FUNCTION ensemble_aver, ima, res, nr, n_iter, ROBUST=robust
  nx = n_elements(ima[*,0])
  ny = n_elements(ima[0,*])

  stack = fltarr(n_iter, res,res)
  
  den = fltarr(res,res)
  FOR i=0L, n_iter-1 DO BEGIN
     ;--- Montecarlo sampling image as PDF
     xr = randomu(seed, nr)
     yr = randomu(seed, nr)
     cr = randomu(seed, nr)
     in = where(ima[xr*nx,yr*ny] GE cr)
     
     xr = xr[in]
     yr = yr[in]
     ;isotropic_voronoi_2d, xr,yr

     den_i = dtfe_2d_fast_ensemble(xr, yr, 0.0,1.0,0.0,1.0, res, 16)
     
     den += den_i

     stack[i,*,*] = den_i
     
     ;tvscale, den

     print, '------------------------ ',i,' ---------------------------'

  ENDFOR
  den /= float(n_iter)

  IF KEYWORD_SET(ROBUST) THEN BEGIN

     fin = fltarr(res,res)
     FOR j=0L, res-1 DO BEGIN
        FOR i=0L, res-1 DO BEGIN
           line = reform(stack[*,i,j])
           fin[i,j] = median(line)           
        ENDFOR
     ENDFOR

     return, fin
     
  ENDIF ELSE BEGIN
     return, den
  ENDELSE
     
  end
  

;window, xs=512,ys=512,retain=2
;device, decomposed=0


FOR www=29L, 50 DO BEGIN

read_jpeg, 'Imas/Gal_'+format_number(www,3)+'.jpg', ima
ima = float(ima)/256.0
nx = n_elements(ima[0,*,0])
ny = n_elements(ima[0,0,*])

;tvscale, ima

ng = 1024L
n_iter = 128
n_ran  = 150000
imar = ensemble_aver(reform(ima[0,*,*]), ng, n_ran, n_iter)
imag = ensemble_aver(reform(ima[1,*,*]), ng, n_ran, n_iter)
imab = ensemble_aver(reform(ima[2,*,*]), ng, n_ran, n_iter)
;imat = ensemble_aver(reform(ima[0,*,*] + ima[1,*,*] + ima[2,*,*])/3.0, ng, n_ran, n_iter)

imac = fltarr(3,ng/2,ng/2) & imac[0,*,*] = average_downsample(imar) & imac[1,*,*] = average_downsample(imag) & imac[2,*,*] = average_downsample(imab)

save, imac, filename='Clean/Gal_'+format_number(www,3)+'.IDL'
write_png, 'Clean/Gal_'+format_number(www,3)+'.png', bytscl(imac)

ENDFOR




end

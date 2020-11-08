#transformar base
library(tidyr)
library(dplyr)
info = openxlsx::read.xlsx("Experimento para trabajar.xlsx", sheet = "datos"); 
info[1, 2] = "1.1"

H = c()
for( i in 1:nrow( info)){
  k = c( as.numeric( info[i,3]), as.numeric( info[i,4]), as.numeric( info[i,5]), as.numeric( info[i, 7]))
  H = append(H, k)
}

D = c()
for( i in 1:nrow( info)){
  k = c( as.numeric( info[i,9]), as.numeric( info[i,10]), as.numeric( info[i,11]), as.numeric( info[i, 13]))
  D = append(D, k)
}

base = data.frame( tratamiento = as.factor( rep( info$Tratamiento, each = 4) ),
                   medida = as.factor( rep( info$Medida, each = 4) ),
                   altura = H,
                   diametro = D,
                   n_med = rep(c(28*1, 28*2, 28*3, 28*5), 10*4 ) 
)

base = base %>% replace_na( list( altura = 0,
                                  diametro = 0
) )

save( base, file = "germinacion.Rdata")
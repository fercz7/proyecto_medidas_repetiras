#transformar base
library(tidyr)
library(dplyr)
info = openxlsx::read.xlsx("Experimento para trabajar.xlsx", sheet = "datos"); 
info[1, 3] = "1.1"
View(info)
H = c()
D = c()
for( i in 1:nrow( info)){
  k = c(  as.numeric( info[i,3+1]), as.numeric( info[i,4+1]), as.numeric( info[i,5+1]), as.numeric( info[i, 7+1]) )
  H = append(H, k)
  j = c(  as.numeric( info[i,9+1]), as.numeric( info[i,10+1]), as.numeric( info[i,11+1]), as.numeric( info[i, 13+1]))
  D = append(D, j)
}


base = data.frame( riego = as.factor( rep( info$Riego, each = 4) ),
                   hongos = as.factor( rep( info$Hongos, each = 4) ),
                   planta = as.factor( rep( info$Medida, each = 4) ),
                   altura = H,
                   diametro = D,
                   dia = rep(c(28*1, 28*2, 28*3, 28*5), 10*4 ) 
)

base = base %>% replace_na( list( altura = 0,
                                  diametro = 0
) )
View( base )
save( base, file = "germinacion.Rdata")




getClimateDist <- function(coordsDF, envRasterStack){
  require(reshape2)
  require(raster)

  if(!is.data.frame(coordsDF) & !is.matrix(coordsDF)){
    stop("coordsDF has to be a data.frame or a matrix")
  }

  coordsDF <- SpatialPoints(coordsDF, proj4string=envRasterStack@crs)
  env <- raster::extract(envRasterStack, coordsDF)
  envScaled <- apply(env, 2, function(x){
    if(any(x < 0)){
      x <- x + abs(min(x, na.rm=TRUE))
    }
    x / max(x, na.rm=TRUE)
  }
  )
  ret <- dist(envScaled)
  ret <- melt(as.matrix(ret), varnames = c("loc1", "loc2"))
  return(ret)
}

## A quick test

library(raster)
envRaster <- raster::getData('worldclim', var='bio', res=2.5)
coordsDF <- structure(list(x = c(-11, -12, -11, -12), y = c(9.09, 10, 9.09,
                                                            10)), .Names = c("x", "y"), row.names = c(NA, -4L), class = "data.frame")

# Better

setwd('/nfs/ccarlson-data/dame/')

cepii <- read.csv("geo_cepii.csv")

getClimateDist(cepii, envRaster)

#' @param Calculates euclidean distance in climatic space
#' 
#' @param coordsDF longitude and latitude
#' @param envRasterStack a rasterStack containing the relevant environmental variables

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

envRaster <- getData('worldclim', var='bio', res=10)
coordsDF <- structure(list(x = c(-11, -12, -11, -12), y = c(9.09, 10, 9.09, 
10)), .Names = c("x", "y"), row.names = c(NA, -4L), class = "data.frame")

getClimateDist(coordsDF, envRaster)

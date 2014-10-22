loadmap <- function(mapdata){
    e = new.env()
    load(mapdata,envir=e)
    return(with(e,gadm))
}

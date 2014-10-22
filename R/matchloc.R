
bestlocate <- function(locs1e, locs2e){
    if(nrow(locs1e)>0){
        loc = bestofloc(locs1e)
        loc$from = 1
    }else{
        loc = bestofloc(locs2e)
        loc$from = 2
    }
    loc
}

bestofloc <- function(locse){
    x = as.numeric(locse$lng)
    y = as.numeric(locse$lat)
    n = length(x)
    centre = c(mean(x),mean(y))
    dr = mean(sqrt((x-centre[1])^2 + (y-centre[2])^2))
    data.frame(x=centre[1], y=centre[2], n=n, dr=dr)
}

matchup <- function(locs1, locs2){
    ldply(1:33,function(i){bestlocate(locs1[[i]],locs2[[i]])})
}


other_matches = rbind(
list("Djingaraye", "Dinguiraye" , -10.675,  11.545),
list("Kouremale", "Kourémalé",-8.78333 , 11.95),
list("Freetown" , "Freetown",-13.22994,  8.484)
    )

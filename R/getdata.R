getHDXdata <- function(method="curl",...){
    dest = tempfile()
    download.file("https://rowca.egnyte.com/dd/mfIyWzxlh7",
                  destfile=dest, method=method, ...)
    dest
}

readHDXdatafile <- function(dest, sheet=2){
    xl = xlsx::read.xlsx(dest,sheet)

    ## fixup some Localite glitches:
    ## 1. Title Case All The Things
    levels(xl$Localite) = stringi::stri_trans_totitle(levels(xl$Localite))
    ## 2. Remove some parens:
    levels(xl$Localite) = stringr::str_replace_all(levels(xl$Localite),"([\\(\\)])","")
    ## 3. Trim space at start and end
    levels(xl$Localite) = stringr::str_trim(levels(xl$Localite))


    ## remove commas from numerics before conversion
    xl$Value = gsub(",","",xl$Value)
    xl$Value = as.numeric(xl$Value)
    # week reference seems to be Sunday at end of week.
    xl$ReportWeek = lubridate::floor_date(xl$Date,"week") + lubridate::weeks(1)
    xl
}

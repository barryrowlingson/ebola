## ------------------------------------------------------------------------
opts_chunk$set(out.width="800px",out.height="400px",
	fig.width=10, fig.height=5)

## ------------------------------------------------------------------------

breakdown = c("Confirmed cases", "Probable cases", "Suspected cases")

ggplot(eb %>% filter(Country=="Liberia", Localite=="National", Category %in% breakdown) %>% arrange(Category), aes(x=ReportWeek,y=Value,fill=Category))+geom_bar(stat="identity")

ggplot(eb %>% filter(Country=="Sierra Leone", Localite=="National", Category %in% breakdown) %>% arrange(Category), aes(x=ReportWeek,y=Value,fill=Category))+geom_bar(stat="identity")


## ------------------------------------------------------------------------
ggplot(eb %>% filter(Category=="Deaths", Country=="Sierra Leone", Localite!="National"), aes(x=Date, y=Value, group=Localite, col=Localite)) + geom_line()

## ------------------------------------------------------------------------
ggplot(eb %>% filter(Category %in% breakdown, Country=="Sierra Leone", Localite!="National"), aes(x=Date, y=Value, group=Localite, col=Localite)) + geom_line() + facet_wrap(~Category,ncol=1)

## ------------------------------------------------------------------------
ggplot(eb %>% filter(Category %in% breakdown, Localite=="National"), aes(x=Date, y=Value, group=Country, col=Country)) + geom_line() + facet_wrap(~Category,ncol=1)

## ------------------------------------------------------------------------
main_countries = c("Guinea","Liberia","Sierra Leone")
ggplot(eb %>% filter(Country %in% main_countries,Category=="Deaths",  Localite!="National"), aes(x=Date, y=Value, group=Localite, col=Localite)) + geom_line() + facet_wrap(~Country,ncol=1)


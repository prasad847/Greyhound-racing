getwd()
#clonmelweatherdata
clonmel_weather_data <- read.csv("clonmelweather.csv",skip = 13)
clonmel_weather_data <- clonmel_weather_data[12146:12691,]
clonmel_weather_data <- cbind(clonmel_weather_data,county = "Clonmel")
View(clonmel_weather_data)

#Dundalkweatherdata
dundalk_weather_data <- read.csv("dundalkweather.csv",skip = 13)
dundalk_weather_data <- dundalk_weather_data[18022:18567,]
dundalk_weather_data <- cbind(dundalk_weather_data,county = "Dundalk")
View(dundalk_weather_data)

#Youghalweatherdata
youghal_weather_data <- read.csv("youghalweather.csv",skip = 13)
youghal_weather_data <- youghal_weather_data[7977:8522,]
youghal_weather_data <- cbind(youghal_weather_data,county = "Youghal")
View(youghal_weather_data)

#waterfordweatherdata
waterford_weather_data <- read.csv("waterfordweather.csv",skip = 13)
waterford_weather_data <- waterford_weather_data[26666:27212,]
waterford_weather_data <- cbind(waterford_weather_data,county = "Waterford")
View(waterford_weather_data)

#traleeweatherdata
tralee_weather_data <- read.csv("traleeweather.csv",skip = 13)
tralee_weather_data <- tralee_weather_data[13729:14274,]
tralee_weather_data <- cbind(tralee_weather_data,county = "Tralee")
View(tralee_weather_data)

#thurles_parkweatherdata
thurles_park_weather_data <- read.csv("thurlesparkweather.csv",skip = 13)
thurles_park_weather_data <- thurles_park_weather_data[1827:2191,]
thurles_park_weather_data <- cbind(thurles_park_weather_data,county = "Thurles_park")
View(thurles_park_weather_data)

#Shelbourne_parkweatherdata
Shelbourne_park_weather_data <- read.csv("Shelbourneparkweather.csv",skip = 13)
Shelbourne_park_weather_data <- Shelbourne_park_weather_data[48278:48792,]
Shelbourne_park_weather_data <- cbind(Shelbourne_park_weather_data,county = "Shelbourne_park")
View(Shelbourne_park_weather_data)

#Newbridgeweatherdata
Newbridge_weather_data <- read.csv("Newbridgeweather.csv",skip = 13)
Newbridge_weather_data <- Newbridge_weather_data[2620:3165,]
Newbridge_weather_data <- cbind(Newbridge_weather_data,county = "Newbridge")
View(Newbridge_weather_data)

#Mullignarweatherdata
Mullignar_weather_data <- read.csv("Mullignarweather.csv",skip = 24)
Mullignar_weather_data <- Mullignar_weather_data[16126:16763,]
Mullignar_weather_data <- cbind(Mullignar_weather_data,county = "Mullingar")
Mullignar_weather_data1 <- Mullignar_weather_data[,c(1,2,3,4,5,8,9,7,18,25)]
colnames(Mullignar_weather_data1)[colnames(Mullignar_weather_data1)== "maxtp"] <- "maxt"
colnames(Mullignar_weather_data1)[colnames(Mullignar_weather_data1)== "mintp"] <- "mint"
View(Mullignar_weather_data1)

#longfordweatherdata
longford_weather_data <- read.csv("longfordweather.csv",skip = 13)
longford_weather_data <- longford_weather_data[17532:18047,]
longford_weather_data <- cbind(longford_weather_data,county = "Longford")
View(longford_weather_data)

#limerickweatherdata
limerick_weather_data <- read.csv("limerickweather.csv",skip = 13)
limerick_weather_data <- limerick_weather_data[12358:12903,]
limerick_weather_data <- cbind(limerick_weather_data,county = "Limerick")
View(limerick_weather_data)

#liffordweatherdata
lifford_weather_data <- read.csv("liffordweather.csv",skip = 13)
lifford_weather_data <- lifford_weather_data[5057:5602,]
lifford_weather_data <- cbind(lifford_weather_data,county = "Lifford")
View(lifford_weather_data)

#Kilkennyweatherdata
kilkenny_weather_data <- read.csv("kilkennyweather.csv",skip = 13)
kilkenny_weather_data <- kilkenny_weather_data[2864:3409,]
kilkenny_weather_data <- cbind(kilkenny_weather_data,county = "Kilkenny")
View(kilkenny_weather_data)

#Galwayweatherdata
Galway_weather_data <- read.csv("Galwayweather.csv",skip = 24)
Galway_weather_data <- Galway_weather_data[2290:2927,]
Galway_weather_data <- cbind(Galway_weather_data,county = "Galway")
Galway_weather_data1 <- Galway_weather_data[,c(1,2,3,4,5,8,9,7,18,25)] 
colnames(Galway_weather_data1)[colnames(Galway_weather_data1)== "maxtp"] <- "maxt"
colnames(Galway_weather_data1)[colnames(Galway_weather_data1)== "mintp"] <- "mint"
View(Galway_weather_data1)

#Enniscorthyweatherdata
Enniscorthy_weather_data <- read.csv("Enniscorthyweather.csv",skip = 13)
Enniscorthy_weather_data <- Enniscorthy_weather_data[5296:5690,]
Enniscorthy_weather_data <- cbind(Enniscorthy_weather_data,county = "Enniscorthy")
View(Enniscorthy_weather_data)

#Final weather data
Final_weather_data <- rbind(Mullignar_weather_data1,Galway_weather_data1,clonmel_weather_data,dundalk_weather_data,dundalk_weather_data,Enniscorthy_weather_data,kilkenny_weather_data,lifford_weather_data,limerick_weather_data,Newbridge_weather_data,Shelbourne_park_weather_data,tralee_weather_data,waterford_weather_data,youghal_weather_data)
View(Final_weather_data)
write.csv(Final_weather_data,file = "Final_weather_data1.csv")
data <- read.csv("Final_weather_data.csv")
View(data)
data$date <- as.Date(data$date, format = "%d-%b-%Y")



class(data$date)
str(data)
##############################################################################################
#Greyhound data extraction

#Extraction of Clonmel
Greyhound_data_frame <- NULL
Clonmel <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=CML&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Clonmel <- rbind(Clonmel,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Clonmel$Date <- substring(Clonmel$Date,1,9)
Clonmel <- cbind(Clonmel,County = "Clonmel")
#Clonmel <- read.csv("Clonmel.csv")
View(Clonmel)
write.csv(Clonmel, file = "Clonmel.csv")

#
#Extraction of Derry
Greyhound_data_frame <- NULL
Derry <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=DRY&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Derry <- rbind(Derry,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Derry$Date <- substring(Derry$Date,1,9)
Derry <- cbind(Derry,County = "Derry")
#Derry <- read.csv("Derry1.csv")
View(Derry)
write.csv(Derry, file = "Derry2.csv")



#Extraction of Drumbo park
Greyhound_data_frame <- NULL
Drumbo_park <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=DBP&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Drumbo_park <- rbind(Drumbo_park,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Drumbo_park$Date <- substring(Drumbo_park$Date,1,9)
Drumbo_park <- cbind(Drumbo_park,County = "Drumbo_park")
#Drumbo_park <- read.csv("Drumbo_park.csv")
View(Drumbo_park)
write.csv(Drumbo_park, file = "Drumbo_park.csv")

#Extraction of Curaheen_park
Greyhound_data_frame <- NULL
Curaheen_park <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=CRK&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Curaheen_park <- rbind(Curaheen_park,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Curaheen_park$Date <- substring(Curaheen_park$Date,1,9)
Curaheen_park <- cbind(Curaheen_park,County = "Curaheen_park")
#Curaheen_park <- read.csv("Curaheen_park.csv")
View(Curaheen_park)
write.csv(Curaheen_park, file = "Curaheen_park.csv")

#Extraction of Dundalk
Greyhound_data_frame <- NULL
Dundalk <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=DLK&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Dundalk <- rbind(Dundalk,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Dundalk$Date <- substring(Dundalk$Date,1,9)
Dundalk <- cbind(Dundalk,County = "Dundalk")
#Dundalk <- read.csv("Dundalk.csv")
View(Dundalk)
write.csv(Dundalk, file = "Dundalk.csv")

#Extraction of Enniscorthy
Greyhound_data_frame <- NULL
Enniscorthy <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=ECY&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Enniscorthy <- rbind(Enniscorthy,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Enniscorthy$Date <- substring(Enniscorthy$Date,1,9)
Enniscorthy <- cbind(Enniscorthy,County = "Enniscorthy")
#Enniscorthy <- read.csv("Enniscorthy.csv")
View(Enniscorthy)
write.csv(Enniscorthy, file = "Enniscorthy.csv")

#Extraction of Galway
Greyhound_data_frame <- NULL
Galway <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=GLY&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Galway <- rbind(Galway,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Galway$Date <- substring(Galway$Date,1,9)
Galway <- cbind(Galway,County = "Galway")
#Galway <- read.csv("Galway.csv")
View(Galway)
write.csv(Galway, file = "Galway.csv")

#Extraction of Kilkenny
Greyhound_data_frame <- NULL
Kilkenny <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=KKY&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Kilkenny <- rbind(Kilkenny,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Kilkenny$Date <- substring(Kilkenny$Date,1,9)
Kilkenny <- cbind(Kilkenny,County = "Kilkenny")
#Kilkenny <- read.csv("Kilkenny.csv")
View(Kilkenny)
write.csv(Kilkenny, file = "Kilkenny.csv")


#Extraction of Lifford
Greyhound_data_frame <- NULL
Lifford <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=LFD&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Lifford <- rbind(Lifford,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Lifford$Date <- substring(Lifford$Date,1,9)
Lifford <- cbind(Lifford,County = "Lifford")
View(Lifford)
write.csv(Lifford, file = "Lifford.csv")

#Extraction of Longford
Greyhound_data_frame <- NULL
Longford <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=LGD&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Longford <- rbind(Longford,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Longford$Date <- substring(Longford$Date,1,9)
Longford <- cbind(Longford,County = "Longford")
View(Longford)
write.csv(Longford, file = "Longford.csv")

#Extraction of limerick data
Greyhound_data_frame <- NULL
Limerick <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=LMK&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Limerick <- rbind(Limerick,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Limerick$Date <- substring(Limerick$Date,1,9)
Limerick <- cbind(Limerick,County = "Limerick")
View(Limerick)
write.csv(Limerick, file = "Limerick.csv")

#Extraction of Mullingar data
Greyhound_data_frame <- NULL
Mullingar <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=MGR&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Mullingar <- rbind(Mullingar,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Mullingar$Date <- substring(Mullingar$Date,1,9)
Mullingar <- cbind(Mullingar,County = "Mullingar")
View(Mullingar)
write.csv(Mullingar, file = "Mullingar.csv")

#Extraction of Newbridge data
Greyhound_data_frame <- NULL
Newbridge <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=NWB&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Newbridge <- rbind(Newbridge,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Newbridge$Date <- substring(Newbridge$Date,1,9)
Newbridge <- cbind(Newbridge,County = "Newbridge")
View(Newbridge)
write.csv(Newbridge, file = "Newbridge.csv")

#Extraction of Shelbourne_park data
Greyhound_data_frame <- NULL
Shelbourne_park <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=SPK&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Shelbourne_park <- rbind(Shelbourne_park,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Shelbourne_park$Date <- substring(Shelbourne_park$Date,1,9)
Shelbourne_park <- cbind(Shelbourne_park,County = "Shelbourne_park")
View(Shelbourne_park)
write.csv(Shelbourne_park, file = "Shelbourne_park.csv")


#Extraction of Tharles_park data
Greyhound_data_frame <- NULL
Tharles_park <- NULL
tryCatch(
  for(k in 2018:2019){
    for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
      for(i in 1:31){
        Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=THR&date=",i,"-",j,"-",k)
        print(Basic_url)
        urll <- read_html(Basic_url)
        Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
        Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
        Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
        Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
        Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
        Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
        By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
        Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
        Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
        SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
        Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
        Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
        Date <- html_nodes(urll,"h3") %>% html_text()
        Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
        n_last <- 10
        Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
        
        
        Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
        Tharles_park <- rbind(Tharles_park,Greyhound_data_frame)
        print(Greyhound_data_frame)
      }
    }
  })
library(rvest)
Tharles_park$Date <- substring(Tharles_park$Date,1,9)
Tharles_park <- cbind(Tharles_park,County = "Tharles_park")
View(Tharles_park)
write.csv(Tharles_park, file = "Tharles_park.csv")


#Extraction of Tralee data
Greyhound_data_frame <- NULL
Tralee <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=TRL&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Tralee <- rbind(Tralee,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Tralee$Date <- substring(Tralee$Date,1,9)
Tralee <- cbind(Tralee,County = "Tralee")
View(Tralee)
write.csv(Tralee, file = "Tralee.csv")


#Extraction of Waterford data
Greyhound_data_frame <- NULL
Waterford <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=WFD&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Waterford <- rbind(Waterford,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Waterford$Date <- substring(Waterford$Date,1,9)
Waterford <- cbind(Waterford,County = "Waterford")
View(Waterford)
write.csv(Waterford, file = "Waterford.csv")

#Extraction of Youghal data
Greyhound_data_frame <- NULL
Youghal <- NULL

for(k in 2018:2019){
  for(j in c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")){
    for(i in 1:28){
      Basic_url <- paste0("https://www.igb.ie/results/view-results/?track=YGL&date=",i,"-",j,"-",k)
      print(Basic_url)
      urll <- read_html(Basic_url)
      Sire_Name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-sire a") %>% html_text()
      Greyhound_name <- html_nodes(urll,"tr:nth-child(2) td > a") %>% html_text()
      Dam_name <- html_nodes(urll,"tr:nth-child(2) .viewresults-pedigree-dam a") %>% html_text()
      Prize <- html_nodes(urll,"tr:nth-child(2) td:nth-child(6)") %>% html_text()
      Weight <- html_nodes(urll,"tr:nth-child(2) td:nth-child(7)") %>% html_text()
      Win_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(8)") %>% html_text()
      By <- html_nodes(urll,"tr:nth-child(2) td:nth-child(9)") %>% html_text()
      Going <- html_nodes(urll,"tr:nth-child(2) td:nth-child(10)") %>% html_text()
      Est_time <- html_nodes(urll,"tr:nth-child(2) td:nth-child(11)") %>% html_text()
      SP <- html_nodes(urll,"tr:nth-child(2) td:nth-child(12)") %>% html_text()
      Grade <- html_nodes(urll,"tr:nth-child(2) td:nth-child(13)") %>% html_text()
      Comment <- html_nodes(urll,"tr:nth-child(2) td:nth-child(14)") %>% html_text()
      Date <- html_nodes(urll,"h3") %>% html_text()
      Name_of_race <- html_nodes(urll,".col-13 h4") %>% html_text()
      n_last <- 10
      Name_of_race1 <- substr(Name_of_race, nchar(Name_of_race) - n_last + 1, nchar(Name_of_race))
      
      
      Greyhound_data_frame <- data.frame(Greyhound_name,Sire_Name,Dam_name,Prize,Weight,Win_time,By,Going,Est_time,SP,Grade,Comment,Date,Name_of_race1)
      Youghal <- rbind(Youghal,Greyhound_data_frame)
      print(Greyhound_data_frame)
    }
  }
}
Youghal$Date <- substring(Youghal$Date,1,9)
Youghal <- cbind(Youghal,County = "Youghal")
View(Youghal)
write.csv(Youghal, file = "Youghal.csv")

#Data Preprocessing
library(ggplot2)
library(tidyr)
Weather <- read.csv("Final_weather_data1.csv")
hist(Weather$gmin)
Weather_outliers <- boxplot(Weather)
Weather_outliers <- boxplot(Weather$rain)
View(Weather)
#Removing the extra column
Weather <- Weather[,-1]
str(Weather)
summary(Weather)
barplot(is.na(Weather)) #Checking NA Values in a dataset
Final_Weather_Dataset <- Weather %>% drop_na()
barplot(is.na(Final_Weather_Dataset))
View(Final_Weather_Dataset)
# Removing extra columns in Weather dataset
Final_Weather_Dataset <- Final_Weather_Dataset[,-c(2,4,6)]
Final_Weather_Dataset$soil <- round(Final_Weather_Dataset$soil, digits = 1)
View(Final_Weather_Dataset)
summary(Final_Weather_Dataset$rain)
max(Final_Weather_Dataset$rain)

boxplot(Final_Weather_Dataset$rain)
#

#Pre-processing
Greyhound_combined_data <- rbind(Clonmel,Curaheen_park,Derry,Dundalk,Enniscorthy,Galway,Kilkenny,Lifford,Limerick,Longford,Mullingar,Newbridge,Shelbourne_park,Tharles_park,Tralee,Waterford,Youghal)
View(Greyhound_combined_data)
write.csv(Greyhound_combined_data,"Greyhound_combined_data.csv")
str(Greyhound_combined_data)
Greyhound_combined_data$Date <- as.Date(Greyhound_combined_data$Date)

Greyhound_combined_data <- read.csv("Greyhound_combined_data.csv")
Greyhound_combined_data$Date <- as.Date(Greyhound_combined_data$Date,format = "%d-%b-%y" )
class(Greyhound_combined_data$Date)
class(Greyhound_combined_data$County)
View(Greyhound_combined_data)

Greyhound_combined_data$Est_time <- substring(Greyhound_combined_data$Est_time,1,5)
class(Greyhound_combined_data$Est_time)
Greyhound_combined_data$Est_time <- as.numeric(Greyhound_combined_data$Est_time)

Greyhound_combined_data$SP <- substring(Greyhound_combined_data$SP,1,3)

write.csv(Greyhound_combined_data,"Greyhound.csv")

Greyhound_combined_data <- read.csv("Greyhound.csv")

library("dplyr")
Greyhound_combined_data1 <- filter(Greyhound_combined_data, SP != "n/p") 

View(Greyhound_combined_data1)

Greyhound_combined_data1 <- Greyhound_combined_data1 %>% mutate(n = substring(Greyhound_combined_data1$SP,1,1))
Greyhound_combined_data1 <- Greyhound_combined_data1 %>% mutate(p = substring(Greyhound_combined_data1$SP,3,3))
Greyhound_combined_data1$n <- as.numeric(Greyhound_combined_data1$n)

Greyhound_combined_data1$p <- as.numeric(Greyhound_combined_data1$p)
class(Greyhound_combined_data1$n)
class(Greyhound_combined_data1$p)

Greyhound_combined_data1 <- Greyhound_combined_data1 %>% mutate(Odds = p/n)
Greyhound_combined_data1$Odds <- round(Greyhound_combined_data1$Odds, digits = 2)

write.csv(Greyhound_combined_data1,"Greyhounddata1.csv")

Greyhound_combined_data1 <- transform(Greyhound_combined_data1,Greyhound_id=as.numeric(factor(Greyhound_name)))
range(Greyhound_combined_data1$Greyhound_id)
class(Greyhound_combined_data1$Greyhound_id)
Greyhound_combined_data1$Greyhound_id <- as.factor(Greyhound_combined_data1$Greyhound_id)

Greyhound_combined_data1 <- transform(Greyhound_combined_data1,Dam_id=as.numeric(factor(Dam_name)))
Greyhound_combined_data1 <- transform(Greyhound_combined_data1,Sire_id=as.numeric(factor(Sire_Name)))
Greyhound_combined_data1$Dam_id <- as.factor(Greyhound_combined_data1$Dam_id)
Greyhound_combined_data1$Sire_id <- as.factor(Greyhound_combined_data1$Sire_id)



Greyhound_combined_data1 <- Greyhound_combined_data1 %>% mutate(Distance = substring(Greyhound_combined_data1$Name_of_race1,6,8))
Greyhound_combined_data1$Distance <- as.numeric(Greyhound_combined_data1$Distance)
class(Greyhound_combined_data1$Distance)

Greyhound_final_dataframe <- Greyhound_combined_data1[,c(3,4,5,6,7,8,10,11,13,15,16,17,20,21,22,23,24)]
View(Greyhound_final_dataframe)
write.csv(Greyhound_final_dataframe,"Greyhound_final_dataframe1000.csv")

colSums(is.na(Greyhound_final_dataframe))

Greyhound_final_dataframe <- filter(Greyhound_final_dataframe, Win_time != "NA")
Greyhound_final_dataframe <- filter(Greyhound_final_dataframe, Odds != "NA")
write.csv(Greyhound_final_dataframe,"a111.csv")

##############Greyhounddata####
Greyhound <- read.csv("a111.csv")
str(Greyhound)
#Greyhound <- Greyhound[-c(1,12,15,16,17)]# Removing irrevelant columns
summary(Greyhound$Win_time)
##

barplot(is.na(Greyhound)) #Checking NA Values in a dataset
View(Greyhound)
#Joining 2 dataframes
View(Final_Weather_Dataset)
colnames(Final_Weather_Dataset)[colnames(Final_Weather_Dataset)== "date"] <- "Date"
colnames(Final_Weather_Dataset)[colnames(Final_Weather_Dataset)== "county"] <- "County"
Final_Weather_Dataset$Date <- as.Date(Final_Weather_Dataset$Date, format = "%d-%b-%Y")
Final_Weather_Dataset$Date <- as.factor(Final_Weather_Dataset$Date)

write.csv(Final_Weather_Dataset,"l.csv")



View(Final_combined_dataset)
Final_combined_dataset <- merge(Greyhound,Final_Weather_Dataset,by = c("County","Date"))
write.csv(Final_combined_dataset,"d.csv")
#Removing unwanted columns in a dataset
Final_combined_dataset <- Final_combined_dataset[,-c(2,3,7,13,15,16,17)]
library("mltools")
library("data.table")
going <- one_hot(as.data.table(Final_combined_dataset$Going))
grade <- one_hot(as.data.table(Final_combined_dataset$Grade))
county <- one_hot(as.data.table(Final_combined_dataset$County))
summary(Final_combined_dataset$County)
summary(Final_combined_dataset$Grade)
summary(Final_combined_dataset$Going)
plot(Final_combined_dataset$County)
plot(Final_combined_dataset$Grade)
plot(Final_combined_dataset$Going)
summary(train$S0)
Data <- cbind(Final_combined_dataset,going,grade,county)
View(Data)

hist(Data$Distance)
Data <- Data[Data$Distance == 525,]
summary(Data$S0)
# Removing column with lesser values
Data <- Data[,-c(1,2,3,4,7,9,17,27,28,29,30,31,32,33,34,35,36,37,38,40,43,51,53,54,55,56,57,58,59,60,61,62,65)]
Data <- Data[,-c(43,44,49,51,53,54,55,56,57)]
Data <- Data[,-c()]
write.csv(Data,"dd.csv")

names(Data)[11]<-"Minus_10_Slow"
names(Data)[12]<-"Minus_15_Slow"
names(Data)[13]<-"Minus_20_Slow"
names(Data)[14]<-"Minus_30_Slow"
names(Data)[15]<-"Minus_40_Slow"
names(Data)[16]<-"Minus_50_Slow"
names(Data)[17]<-"Minus_60_Slow"
names(Data)[18]<-"Minus_70_Slow"
names(Data)[19]<-"Minus_80_Slow"
names(Data)[20]<-"Sand"
names(Data)[21]<-"A0"
names(Data)[22]<-"A1"
names(Data)[23]<-"A2"
names(Data)[24]<-"A3"
names(Data)[25]<-"A4"
names(Data)[26]<-"A5"
names(Data)[27]<-"A6"
names(Data)[28]<-"A7"
names(Data)[29]<-"A8"
names(Data)[30]<-"AA0"
names(Data)[31]<-"S0"
names(Data)[32]<-"S1"
names(Data)[33]<-"S2"
names(Data)[34]<-"S3"
names(Data)[35]<-"S4"
names(Data)[36]<-"S5"
names(Data)[37]<-"S6"
names(Data)[38]<-"S7"
names(Data)[39]<-"S8"
names(Data)[40]<-"S9"
names(Data)[41]<-"SS0"
names(Data)[42]<-"Clonmel"
names(Data)[43]<-"Dundalk"
names(Data)[44]<-"Enniscorthy"
names(Data)[45]<-"Galway"
names(Data)[46]<-"Kilkenny"
names(Data)[47]<-"Limerick"
names(Data)[48]<-"Mullignar"
names(Data)[49]<-"Youghal"


Data <- Data[-c(5,12,31,32,33,34,35,36,37,38,39,40,41)]

write.csv(Data,"Final1.csv")
Data <- read.csv("Final1.csv")

#Checking significant impact
lm <- lm(Win_time~maxt+mint+rain+soil+gmin, data = Final_combined_dataset)
summary(lm)
##Boruta
library(ranger)
library(Boruta)
Boruta_output <- Boruta(Win_time ~ ., data = Data , doTrace=2)
print(Boruta_output)
getSelectedAttributes(Boruta_output)
b1<- attStats(Boruta_output)

##pizza menu  
Pizza_menu <-data.frame(
  id = 1:3, 
  name = c("Pizza_Truffle",
           "Pizza_ChickenBBQ",
           "Pizza_Hawaiian"),
  price = c(399,350,320))

##extra menu 
Extra <-data.frame(
  id_extra = 1:3,
  name_extra = c("Upsize M->L", 
                 "Extracheet",
                 "No_extra"),
  Price_extra = c(99,150,0))


bot_pizza <- function (){
  
  print ("Welcome to ABC_pizza")
  print (Pizza_menu)
  Pizza_price <-0 
  print ("Plz select id [1:3]")
  
  while (TRUE) 
    Order_pizza <- as.numeric(readLines("stdin", n=1))
  if (Order_pizza == 1) {
    Pizza_price <- 399 
    break
  }  else if (Order_pizza == 2) {
    Pizza_price <- 350 
    break 
  } else {print ("OK")} }


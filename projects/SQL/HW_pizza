bot_pizza <- function () {
   
print ("Welcome to ABC_pizza")
##pizza menu  
Pizza_menu <-data.frame(
  id = 1:3, 
  name = c("Pizza_Truffle",
           "Pizza_ChickenBBQ",
           "Pizza_Hawaiian"),
  price = c(399,350,320))
print(Pizza_menu)
print ("Plz select id [1:3]")
Order_pizza <- as.numeric(readLines("stdin", n=1))
     if (Order_pizza ==1) {Price_pizza <- 390
    }    else if (Order_pizza ==2) {Price_pizza <- 350
    }    else if(Order_pizza ==3) {Price_pizza <- 320
    }    else {print ("try again!")}
    
   ##extra menu 
Extra <-data.frame(
  id_extra = 1:3,
  name_extra = c("Upsize M->L", 
                 "Extracheet",
                 "No_extra"),
  Price_extra = c(99,150,0))
print (Extra)
print ("Plz select id_extra [1:3]")
Order_extra <- as.numeric(readLines("stdin", n=1))
     if (Order_extra ==1) {Price_extra_cus <- 99
    }    else if (Order_extra ==2) {Price_extra_cus <- 150
    }    else if(Order_extra ==3) {Price_extra_cus <- 0
    }    else {print ("try again!")}

## Total price 
         print(total_price <- Price_pizza+Price_extra_cus)
    print ("Thank you")
}
bot_pizza()

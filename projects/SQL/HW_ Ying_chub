game <-function(){
    print ("Welcome ! les't play game ^ ^ ")
rps<-c("r","p","s")
rps.df <- data.frame(
    no = 1:3,
    name = c("rock","paper","scissors"),
    input  = c("r","p","s"))
print (rps.df)
    
while (TRUE) {
    ## user ##
    print ("please select r,p,s or q for exit")
    user_play <-readLines("stdin", n=1)
    print (paste("you choose", user_play))
    
    if(user_play == "q"){
    print("See you next time") 
        break
    }

    ## bot ## 
    bot_play <-sample(rps,1)
    print (paste("bot choose",bot_play))

    if(user_play == "r" & bot_play == "s"|
       user_play == "s" & bot_play == "p"|
       user_play == "p" & bot_play == "r"
      ) {print ("You Win!") 
       } else if (
        user_play == "r" & bot_play == "p"|
       user_play == "p" & bot_play == "s"|
       user_play == "s" & bot_play == "r"
      ) {print ("You lose!") 
        } else if (
        user_play == "r" & bot_play == "r"|
       user_play == "p" & bot_play == "p"|
       user_play == "s" & bot_play == "s"
        ) {print ("Tied")}
    
    
    }
}
          
game()



 
   

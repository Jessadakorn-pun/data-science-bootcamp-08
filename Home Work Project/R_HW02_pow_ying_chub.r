pys <- function() {
  option <- c("R", "P", "S")
  u_score <- 0
  b_score <- 0
  print("Hi Bro!!, welcome to Rock Paper Scissors Game")
  
  while (TRUE) {
    print("Select [R, P ,S] | To exist press Q")
    
    ip <- readLines("stdin", n = 1)
    rd <- sample(option, size = 1)

    if(ip == "Q"){
      break
    }
    print(paste("You :", ip, "Bot :", rd))  
    
    if(ip == "R" & rd == "S") {
      u_score <- u_score + 1
      print("Win !!")
    } else if (ip == "P" & rd == "R") {
      u_score <- u_score + 1
      print("Win !!")
    } else if (ip == "S" & rd == "P") {
      u_score <- u_score + 1
      print("Win !!")
    } else if (ip == rd) {
      print("Draw !!")
    } else {
      b_score <- b_score + 1
      print("Lose !!")
    }
      
      
  }
  print(paste("Your socre :", u_score, "Bot score :", b_score))
  if (u_score > b_score) {
      print("You Win")
    } else if (u_score == b_score) {
      print("Draw Game")
    } else {
      print("You Lose")
    }
}

pys()

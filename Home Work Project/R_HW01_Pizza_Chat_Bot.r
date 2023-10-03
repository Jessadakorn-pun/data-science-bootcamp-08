pizza_chatbot <- function() {
  total_price <- 0
  order <- "pizza order : "
  print("Hello, Welcome to Pun pizza")
  print("---------------------------")
  print("Select type of pizza dough")
  print("[A : Napolitana 5$ | B : Newyork 3$ | C : Chicago 8$ ]")
  dough <- readLines("stdin", n = 1)
  if (dough == "A") {
    total_price <- total_price + 5
    order <- paste(order, 'Napolitana')
  } else if (dough == "B") {
    total_price <- total_price + 3
    order <- paste(order, 'Newyork')
  } else if (dough == "C") {
    total_price <- total_price + 8
    order <- paste(order, 'Chicago')  
  }
  print("---------------------------")
  
  print("Select Pizza sauce")
  print("[D : Tomato 0.5$ | E : Cream 1$]")
  sauce <- readLines("stdin", n = 1)
  if (sauce == "D") {
    total_price <- total_price + 0.5
    order <- paste(order, 'Tomato Sauce')  
  } else if (sauce == "E") {
    total_price <- total_price + 1
    order <- paste(order, 'Cream Sauce')  
  }

  print("---------------------------")

  print("Slect Topping")
  print("[F : Papoloni 2$ | G : Bacon 1$ | H : Sausage 3$] press Q to exit")
  order <- paste(order, "with")
  
  while (TRUE) {
    topping <- readLines("stdin", n = 1)
    if (topping == "Q") {
      break
    } else {
      if (topping == "F") {
        total_price <- total_price + 2
        order <- paste(order, 'Papoloni')  
      } else if (topping == "G") {
        total_price <- total_price + 1
        order <- paste(order, 'Bacon')  
      } else if (topping == "H") {
        total_price <- total_price + 3
        order <- paste(order, 'Sausage')  
      }
    } 
  }

  print(order)
  print(paste("Total price : ", total_price ))
  
}

pizza_chatbot()

#chat bot pizza
library(glue)
pizza_order = function(){
  print('Welcome to our pizza shop!! Here our menu')  
  print("1.Hawaiian")
  print("2.Seafood")
  print("3.Pepperoni")
  print("4.Chesse")
  pizza_choice = readline("Select your pizza by typing number (1-4): ")
  if(pizza_choice == 1) {
    pizza = 'Hawaiian'
  }
  if(pizza_choice == 2) {
    pizza = 'Seafood'
  }
  if(pizza_choice == 3){
    pizza = 'Pepperoni'
  }
  if(pizza_choice == 4){
    pizza = 'Cheese'
  }
  
  print("Select size for your pizza!!")
  print("1. S (4 pieces) : 150 THB")
  print("2. M (6 pieces) : 200 THB")
  print("3. L (8 pieces : 250 THB ")
  size_choice = readline("Select your pizza size by typing number (1-3): ")
  if(size_choice == 1){
    size = 'S'
    pizza_price = 150
  }
  if(size_choice == 2){
    size = 'M'
    pizza_price = 200
  }
  if(size_choice == 3){
    size = 'L'
    pizza_price = 250
  }
  
  print("Select your beverage!!")
  print("1.Cola : 30 THB")
  print("2.Sprite : 30 THB")
  print("3.Drinking water : 20 THB")
  print("4.No beverage")
  bev_choice = readline("Select your beverage by typing number (1-4): ")
  if(bev_choice == 1){
    bev = 'Cola'
    bev_price = 30
  }
  if(bev_choice == 2){
    bev = 'Sprite'
    bev_price = 30
  }
  if(bev_choice == 3){
    bev = 'Drinking water'
    bev_price = 20
  }
  if(bev_choice == 4){
    bev = ''
    bev_price = 0
  }
  
   #summary bill
   print("Here your bill")
   print(glue("Pizza: {pizza}"))
   print(glue("Size: {size}"))
   print(glue("Pizza price: {pizza_price}"))
   print(glue("Beverage: {bev}"))
   print(glue("Beverage Price: {bev_price}"))
   print(glue("Total price: {pizza_price + bev_price} THB"))
   
}

#pao ying chub
library(tidyverse)
library(glue)
hands = c("hammer","scissor","paper")

print_hand = function(user_input,bot){
  if(user_input == 1){
    user_hand = 'hammer'
  } 
  else if(user_input == 2){
    user_hand = 'scissor'
  }
  else if(user_input == 3){
    user_hand = 'paper'
  } 
  print(glue('Your hand is {user_hand}'))
  print(glue('Bot hand is {bot} '))
}

play_game = function(){
  game = 0
  user_input = ""
  bot = ""
  user_win = 0
  bot_win = 0
  while(game < 10){
    bot = sample(hands,1)
    print(glue('Round: {game+1}'))
    cat("Select the number: 
    1.hammer 2.scissor 3.paper")
    user_input = readline()
    if(user_input == '1') {
      if(bot == 'hammer'){
        print_hand(user_input,bot)
        print("Draw!!")
     }
     else if(bot == 'scissor'){
       print_hand(user_input,bot)
       user_win = user_win  + 1
       print('You win!!')
     }
     else if(bot == 'paper'){
       print_hand(user_input,bot)
       bot_win = bot_win + 1
       print('You lost!!')
     }
    } 
    if(user_input == '2') {
      if(bot == 'hammer'){
        print_hand(user_input,bot)
        bot_win = bot_win + 1
        print("You lost!!")
      }
      else if(bot == 'scissor'){
        print_hand(user_input,bot)
        print('Draw!!')
      }
      else if(bot == 'paper'){
        print_hand(user_input,bot)
        user_win = user_win  + 1
        print('You win!!')
      }
    }
    if(user_input == '3') {
      if(bot == 'hammer'){
        print_hand(user_input,bot)
        user_win = user_win  + 1
        print("You win!!")
      }
      else if(bot == 'scissor'){
        print_hand(user_input,bot)
        bot_win = bot_win + 1
        print('You lost!!')
      }
      else if(bot == 'paper'){
        print_hand(user_input,bot)
        print('Draw!!')
      }
    }
    print(glue('Score: You = {user_win} , Bot = {bot_win} '))
    game = game+1
  }
  print(glue('Summary score is You = {user_win} , Bot = {bot_win}'))
  if(user_win==bot_win){
    print('Draw!!')
  }
  else if(user_win>bot_win){
    print('Congratulation you win!!')
  }
  else if(user_win<bot_win){
    print('Sorry you lost!!')
  }
}

play_game()

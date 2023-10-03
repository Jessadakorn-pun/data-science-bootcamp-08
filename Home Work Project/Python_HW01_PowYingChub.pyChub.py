## HW01 - creat game pao ying chub
import random
def pao_ying_chub():
    user_score = 0
    bot_score = 0
    draw_match = 0
    choice = ["rock", "paper", "scissor", "quit"]
    choice_b = ["rock", "paper", "scissor"]
    round_log = []
    count = 0
    while True:
        user = input("\nChoose your anser [rock, paper, scissor, quit] : ").lower().strip()
        ran = random.choice(choice_b) 
        if user in choice:
            count += 1
            if user == "quit":

                print(f"\nHERE IS YOURE RESULT : WIN = {user_score}, LOSE = {bot_score}, DRAW = {draw_match}")
                print("\nHERE IS YOUR HISTORY :")
                
                for e in round_log:
                    print(e)

                if bot_score > user_score:
                    print(f"\nSorry You Lose :)")
                    break

                elif bot_score < user_score:
                    print(f"\nOh Yeaaaaa!! You Win :(")
                    break

                else:
                    print(f"\nSo close, You Draw :|")
                    break

            elif (user == "rock" and ran == "rock") or (user == "paper" and ran == "paper") or (user == "scissor" and ran == "scissor"):
                print(f"Bot : {ran}")
                print("Draw !!")
                draw_match += 1
                round_log.append([f"round : {count}", f"user : {user}", f"bot : {ran}", f"result : Draw" ])

            elif (user == "rock" and  ran == "scissor") or (user == "scissor" and ran == "paper") or (user == "paper" and ran == "rock"):
                print(f"Bot : {ran}")
                print("You win This round !!")
                user_score += 1
                round_log.append([f"round : {count}", f"user : {user}", f"bot : {ran}", f"result : Win" ])
            else:
                print(f"Bot : {ran}")
                print("You lose this round !!")
                bot_score += 1
                round_log.append([f"round : {count}", f"user : {user}", f"bot : {ran}", f"result : Lose" ])
        else:
            print("\nYour input is not correct format, Please input your answer again")

pao_ying_chub()

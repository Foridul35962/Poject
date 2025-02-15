import random
import time
import termcolor
import pyfiglet

def score(mp,cp,manc,comc):
    print("Your choice is:",manc)
    print("Computer choice is: ",comc)
    print("Your point:",mp)
    print("Computer point:",cp)

def wtl(mp,cp):
    print("Your point:",mp)
    print("Computer point:",cp)

def choice():
    print("Enter any number by your choiceing:")
    print("Enter 1 for: ",termcolor.colored("Rock",'green'))
    print("Enter 2 for: ",termcolor.colored("Paper",'red'))
    print("Enter 3 for: ",termcolor.colored("Scissors",'blue'))
    a=int(input("Enter your choice number: "))
    return a

ban=termcolor.colored(pyfiglet.figlet_format("Welcome to Game"),'green')
print(ban)
ban=termcolor.colored(pyfiglet.figlet_format("Of"),'red')
print(ban)
ban=termcolor.colored(pyfiglet.figlet_format("Rock Paper Scissors"),'blue')
print(ban)
time.sleep(2.0)
t=int(input("Enter how many point do you want to play: "))

mp=0
cp=0
l=0

while mp<t and cp<t:
    time.sleep(2.0)
    if(l==0):
        a=choice()
        l+=1
    else:
        a=int(input("Again enter your choice number: "))
    
    if(a>3 or a<1 ):
        print("You enter wrong choice. please try again.")
        continue

    ch=['Rock','Paper','Scissors']
    manc=ch[a-1]
    comc=random.choice(ch)
    
    if(manc==comc):
        score(mp,cp,manc,comc)
    elif(manc=="Rock" and comc=="Scissors") or \
    (manc=="Paper"and comc=="Rock") or \
    (manc=="Scissors"and comc=="Paper"):
        mp+=1
        score(mp,cp,manc,comc)
    else:
        cp+=1
        score(mp,cp,manc,comc)

if(mp==cp):
    print("\n\tThe match is {}.".format(termcolor.colored("Tie",'blue')))
elif(mp>cp):
    print("\n\tYou {} the match".format(termcolor.colored("Win",'green')))
else:
    print("\n\tYou {} the match".format(termcolor.colored("Lose",'red')))
print("\n\t\tGame Over")

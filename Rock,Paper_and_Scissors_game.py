import random
import time
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
    print("Enter 1 for: Rock")
    print("Enter 2 for: Paper")
    print("Enter 3 for: Scissors")
    a=int(input("Enter your choice number: "))
    return a


print("\t\tWelcome to Rock, Paper and Scissors game")
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
    wtl(mp,cp)
    print("\n\tThe match is tie.")
elif(mp>cp):
    wtl(mp,cp)
    print("\n\tYou Win the match")
else:
    wtl(mp,cp)
    print("\n\tYou lose the match")
print("\n\t\tGame Over")
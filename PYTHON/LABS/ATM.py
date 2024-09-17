balance=5000
amount=0
n=0
print("1-Withdraw","\n2-Balance Inquirey","\n3-Fast cash","\n4-Quit")
choice=int(input("Enter your 4-digit number : 1234 : "))
if(choice>=1 and choice<=4) :
    if(choice==1):
        n=int(input("Enter a withdraw amount (multiple of 100) :"))
        if(n%100==0):
            print("TRRRRRRRRRRRRRRRRRRRRRRRRRRR")
            balance=5000-n
            print(balance)
        else:
            print("Invalid withdraw")
    elif(choice==2):
        print(balance)
    elif(choice==3):
        print("1-500$","\n2-1000$","\n3-5000$","\n4-10000$","\n5-50000$")
        n=int(input("Enter Amount: "))
        if(n==1):
            amount=500
        elif(n==2):
            amount=1000
        elif(n==3):
            amount=5000
        elif(n==4):
            amount=10000
        elif(n==5):
            amount=50000
        else:
            print("ENTER A VALID NUMBER PLEASE")

        if(amount<balance):
             print("TRRRRRRRRRRRRRRRR")
             balance=balance-amount
        else:
             print("invalid balance")
    elif(n==4):
            quit
else:
    print("INVALID CHOICE")







    


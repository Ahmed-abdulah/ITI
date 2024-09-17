word="BANANA"
guessed_word="_"*len(word)
print(guessed_word)
trials=6
while (trials>0 and guessed_word!=word):
    guessed_letter=input("Enter a suitable letter : ")
    guessed_letter=guessed_letter.capitalize()#is that right?
    

    
    if  guessed_letter.isalpha() and len(guessed_letter)==1:
        index=word.find(guessed_letter)
        if index!=-1:
            print("GREAT"+"\nYOU GOT IT RIRGT")
            if(guessed_letter in guessed_word):
                index=word.find(guessed_letter,index+1)
            guessed_word=guessed_word[:index]+guessed_letter+ guessed_word[index+1:]
            print(guessed_word)
        
            continue
        else:
            print("Wrong!"+"\nguess again")
            trials=trials-1
            print("you have "+str(trials)+" trials")
            continue
       
    else:
        print("ERROR!"+"\nEnter a single valid character")
        continue

if(trials==0):
    print("SORRY "+"\nYOU HAVE LOST")

if(guessed_word==word):
    print("CONGRATULATIONS!"+"\n YOU ARE THE BEST")







   




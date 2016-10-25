#Defines some variables
a=0 #Number of frames in the animation. 
i=0 #i thrown number. On initalisation it will be set to a random number beetween 1 and 6
#Generate Diceimages and set an Achor with their numbers
rollDices(){
printf "\033c"
zahl=$(($RANDOM%6+1)) 
if [ $zahl -eq 1 ]
then
#echo "a=" $a "i=" $i "zahl=" $zahl
echo "#############"
echo "#           #"
echo "#           #"
echo "#     #     #"
echo "#           #"
echo "#           #"
echo "#############"
elif [ $zahl -eq 2 ]
then
#echo "a=" $a "i=" $i "zahl=" $zahl
echo "#############"
echo "#           #"
echo "#   #       #"
echo "#           #"
echo "#       #   #"
echo "#           #"
echo "#############"
elif [ $zahl -eq 3 ]
then
#echo "a=" $a "i=" $i "zahl=" $zahl
echo "#############"
echo "#           #"
echo "#  #        #"
echo "#     #     #"
echo "#        #  #"
echo "#           #"
echo "#############"
elif [ $zahl -eq 4 ]
then
#echo "a=" $a "i=" $i "zahl=" $zahl
echo "#############"
echo "#           #"
echo "#  #     #  #"
echo "#           #"
echo "#  #     #  #"
echo "#           #"
echo "#############"
elif [ $zahl -eq 5 ]
then
#echo "a=" $a "i=" $i "zahl=" $zahl
echo "#############"
echo "#           #"
echo "#  #     #  #"
echo "#     #     #"
echo "#  #     #  #"
echo "#           #"
echo "#############"
elif [ $zahl -eq 6 ]
then
#echo "a=" $a "i=" $i "zahl=" $zahl
echo "#############"
echo "#  #     #  #"
echo "#           #"
echo "#  #     #  #"
echo "#           #"
echo "#  #     #  #"
echo "#############"
else
echo $a
#In case of you broke my radomizer, You'll get this number
echo "An Error occured! The Number was" $zahl "!"
sleep 2
printf "\033c"
wurf
fi
}
#Asks for retry or exit the dices.sh
menue(){
echo 
read -n1 -r -p "Press Space to roll the dices again! Press any other key to terminate!" key
if [ "$key" = '' ]; then
a=0 #Resets the animation timer
wurf
else
echo ""
echo "Bye"
fi
}
#Creates an animation which makes the throw more realistic.
wurf(){
while [ $a -lt 10 ]
do
rollDices
if [ $zahl -eq $i ] #When the Dice will be shown, the number wont be the same while it's rolling 
then
rollDices 
else 
if [ $i -eq 1 ] && [ $zahl -eq 6 ]   #Compares the i thrown number with the new one before the Image will be generated. If there is an impossible turn it won't be drawn  
then
i=$(($zahl))                                    #If Number 1 then you can't get a six without having to show a 2,3,4 or a 5
rollDices                               #If Number 2 then you can't get a five without showing a 1,3,4 or a 5
elif [ $i -eq 2 ] && [ $zahl -eq 5 ] #And so one
then
i=$(($zahl))                                    #So on every "unrealistic" number, the routine throws the dices again
rollDices
elif [ $i -eq 3 ] && [ $zahl -eq 4 ] 
then
i=$(($zahl))
rollDices
elif [ $i -eq 4 ] && [ $zahl -eq 3 ] 
then
i=$(($zahl))
rollDices
elif [ $i -eq 5 ] && [ $zahl -eq 2 ] 
then
i=$(($zahl))
rollDices
elif [ $i -eq 6 ] && [ $zahl -eq 1 ] 
then
i=$(($zahl))
rollDices
else
sleep 0.01
a=`expr $a + 1`
i=$(($zahl))
fi
fi
done
sleep 0.1
menue #Asks for a retry
}

#INIT#
echo "Version 1.1.0: Created by Jannis Radke"
echo "Developed on a Raspberry Pi"
sleep 2
i=$(($RANDOM%6+1))
wurf
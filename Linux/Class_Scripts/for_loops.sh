#!/bin/bash
#Script to practice loops, if Hawaiiis in the states will proumt a message.
states=(
	'California'
	'Arizona'
	'Hawaii'
	'New York'
	'Kansas'
)

#create loops
for state in ${states[@]};
do
 if [ $state = 'Hawaii' ]
 then
  echo "Hawaii is the best"
 #else
 # echo "I'm not fond to Hawaii"
 fi
done


#BONUS
#Script to practice Loops, if 3, 5 or 7 are found, it will print the number
numbers=(0 1 2 3 4 5 6 7 8 9)
for num in ${numbers[@]};
do
  if [ $num = 3 } || [$num = 5 ] || [$num = 7 ]
  then
    echo $num
  fi
done

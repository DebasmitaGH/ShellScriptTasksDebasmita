#!/bin/bash

#Author – Debasmita DasGupta
#Version – 1.0
#Descritpion – This shell script will do arithmatic functions on provided inputs

#This function is responsible for doing provided arithmatic function on provided inputs. “Operands” will be a list for example 12 19 20 13 and then wil add / multiply / subtract / divide these numbers and provide the final result.
#The same function can also be implemented using a “switch” case also.

function arithmaticFunctions()
{
oprt=$1
oprnd=("$@")
arrayindex=0
for num in ${!oprnd[@]}
do
echo "${oprnd[@]}"
operand="${oprnd[$num + 1]}"
echo $operand
if [ $arrayindex -eq 0 ]; then
result=$operand
echo "In IF block, The result is: $result"
elif [ $[$num + 1]  -lt ${#oprnd[@]} ]
then
#result=$(( $result $operator $operand))
result=`expr $result $operator $operand`
ERROR_CODE=$(echo $?)
ERROR_MSG=$(echo $?)
echo "In ELSE block, The result is: $result"
if [ $ERROR_CODE -ne 0 ]; then
echo -e “There was some issue in performing the operation \"$oprt\" on the operands \"$operand\". The Error Code is: $ERROR_CODE. The Error Message is: $ERROR_MSG”
exit 1
fi
fi
arrayindex=1
done
echo -e "The final result is: $result"
}

#This snippet is responsible for taking the user input.
while [[ -z $operator  ||  -z $operands ]]
do
echo -e “Please enter an operator \(example +, *, /, %. Kindly enter just 1 operator\): “
read operator
echo -e “Please enter the operands \(example 1 2 3 4 5\): “
read operands
num_array=("${num_array[@]}" $operands)
done

#The function (for performing the user provided arithmatic operation) call
arithmaticFunctions $operator "${num_array[@]}"


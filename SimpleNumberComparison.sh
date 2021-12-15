#!/usr/bin/env bash

echo -n "Type in your first number: "   ; read num1
echo -n "Type in your second number: "  ; read num2

if [[ num1 -gt num2 ]]; then
        echo "$num1 is greater than $num2"
elif [[ num2 -gt num1 ]]; then
        echo "$num2 is greater than $num1"
elif [[ num1 -eq num2 ]]; then
        echo "These two numbers ($num1, $num2) are equivalent."
else    
        echo "Try again. This program shall terminate."
fi      

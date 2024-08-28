#!/bin/bash

# Function to perform calculation based on operator
calculate() {
    local num1=$1
    local operator=$2
    local num2=$3

    case $operator in
        +)
            result=$(echo "$num1 + $num2" | bc)
            ;;
        -)
            result=$(echo "$num1 - $num2" | bc)
            ;;
        \*)
            result=$(echo "$num1 * $num2" | bc)
            ;;
        /)
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero is not allowed."
                exit 1
            fi
            result=$(echo "scale=2; $num1 / $num2" | bc)
            ;;
        *)
            echo "Invalid operator: $operator"
            exit 1
            ;;
    esac
    echo "Result: $num1 $operator $num2 = $result"
}

# Prompt the user for input
read -p "Enter the first number: " num1
read -p "Enter an operator (+, -, *, /): " operator
read -p "Enter the second number: " num2

# Validate if the inputs are numbers
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Both inputs must be valid numbers."
    exit 1
fi

# Call the calculate function with the inputs
calculate "$num1" "$operator" "$num2"

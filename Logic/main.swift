//
//  main.swift
//  Logic
//
//  Created by Андрей Барсуков on 17.01.2023.
//

import Foundation

// MARK: enum with operations types
enum Operations {
    case noAction
    case addition
    case substraction
    case multiplication
    case division
}

// MARK: variables
var isRunning = true
var currentNumber = "0"
var firstNumber = 0.0
var secondNumber = 0.0
var result = ""
var currenOperation = Operations.noAction

// MARK: program points
func runLoop() {
    while isRunning {
        start()
    }
}

func start() {
    print("Do you want to make calculation?")
    print("Enter \"yes\" or \"no\":")
    let answer = readLine()
    if answer == "yes" {
        updateDisplay(text: "Enter first number:")
        let firstEnter: String = readLine()!
        currentNumber = firstEnter
        updateDisplay(text: "Enter operation type (+ - / *):")
        let operationEnter: String = readLine()!
        switch operationEnter {
        case "+":
            addition()
        case "-":
            substraction()
        case "*":
            multiplication()
        case "/":
            division()
        default:
            break
        }
        updateDisplay(text: "Enter second number:")
        let secondEnter: String = readLine()!
        currentNumber = secondEnter
        makeResult()
        updateDisplay(text:
        """
        _______________________
        Result of calculation: \(result)
        _______________________
        \n
        """
        )
    } else {
        finish()
    }
}

func finish() {
    print("Program is ended.")
    isRunning = false
}

// MARK: functions
func updateDisplay(text: String) {
    print(text)
}

func makeCalculation(operation: Operations) {
    if currenOperation != .noAction {
        if currentNumber != "" {
            secondNumber = Double(currentNumber) ?? 0.0
            switch operation {
            case .addition:
                result = String(firstNumber + secondNumber)
            case .substraction:
                result = String(firstNumber - secondNumber)
            case .multiplication:
                result = String(firstNumber * secondNumber)
            case .division:
                result = String(firstNumber / secondNumber)
            default:
                break
            }
        }
    } else {
        firstNumber = Double(currentNumber) ?? 0.0
        currentNumber = ""
        updateDisplay(text: currentNumber)
        currenOperation = operation
    }
    print(
    """
    \n
    -------------------
    current number = \(currentNumber)
    first = \(firstNumber)
    second = \(secondNumber)
    result = \(result)
    -------------------
    \n
    """
    )
}
func addition() {
    makeCalculation(operation: .addition)
}
func substraction() {
    makeCalculation(operation: .substraction)
}
func multiplication() {
    makeCalculation(operation: .multiplication)
}
func division() {
    makeCalculation(operation: .division)
}
func makeResult() {
    makeCalculation(operation: currenOperation)
}
func acAction() {
    var currentNumber = ""
    var firstNumber = 0.0
    var secondNumber = 0.0
    var result = ""
    var currenOperation = Operations.noAction
    updateDisplay(text: currentNumber)
}

// MARK: program flow
print("SympleCalc program.")
print("Welcome to SimpleCalc. \n")
runLoop()

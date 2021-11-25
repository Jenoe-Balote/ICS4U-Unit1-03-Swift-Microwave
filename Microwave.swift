//
//  MicrowaveFood.swift
//
//  Created by Jenoe Balote
//  Created on 2021-11-24
//  Version 1.0
//  Copyright (c) 2021 Jenoe Balote. All rights reserved.
//
//  This program calculates the time needed to heat food.
//

import Foundation

// Constants
// intervals of increase
let zeroPercentIncrease = 1.0
let fiftyPercentIncrease = 1.5
let hundredPercentIncrease = 2.0

// food item heating times
let subTime = 60.0
let pizzaTime = 45.0
let soupTime = 105.0

let secsInMin = 60.0

// cook time variables
var cookTime: Double
var cookTimeSeconds: Double
var cookTimeMinutes: Double

// food item quantity
let oneItem = 1
let twoItems = 2
let threeItems = 3

// Food Input
print("This program shows the total cook time.")
print("Are you heating a sub, pizza or soup?: ", terminator: "")

// For loop
while true {
    guard let foodInput = readLine(), !foodInput.isEmpty else {
    print("That's not an option!")
    continue
    }
    // checking string value
    switch foodInput {
    case "sub": cookTime = subTime
    case "pizza": cookTime = pizzaTime
    case "soup": cookTime = soupTime
    default: print("Invalid input, try again.")
        continue
     }
    // food quantity input
    print("Enter how many you are heating (1-3): ", terminator: "")
    while true {
        guard let numOfItemsString = readLine(), !numOfItemsString.isEmpty else {
        print("That's not an option")
        continue
        }
        if let numOfItems = Int(numOfItemsString) {
            // checking string value
            switch numOfItems {
            case oneItem: cookTime *= zeroPercentIncrease
            case twoItems: cookTime *= fiftyPercentIncrease
            case threeItems: cookTime *= hundredPercentIncrease
            default: print("Invalid input, try again.")
                continue
            }
        }
        // Separates minutes and seconds for output
        cookTimeMinutes = cookTime / secsInMin
        cookTimeSeconds =
        Double(cookTime).truncatingRemainder(dividingBy: secsInMin)
        // Output
        print("\nThe total cook time is "
                     + String(format: "%.0f", floor(cookTimeMinutes))
                     + " minute(s) and "
                     + String(format: "%.01f", cookTimeSeconds)
                     + " second(s).")
    break
    }
break
}

print("\nDone.")

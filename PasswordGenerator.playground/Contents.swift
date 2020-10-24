import UIKit

var str = "Hello, playground"

let arrayGeneret = ["a","b","c","d","e","f","g","h","j","k","l","n","m","o","p","q","r","s","t","u","v","w","x","y","z"]

var one = arrayGeneret[Int.random(in: 1...24)]
var two = arrayGeneret[Int.random(in: 1...24)]
var three = arrayGeneret[Int.random(in: 1...24)]
var four = arrayGeneret[Int.random(in: 1...24)]
var five = arrayGeneret[Int.random(in: 1...24)]
var six = arrayGeneret[Int.random(in: 1...24)]

var password = one + two + three + four + five + six

print(password)

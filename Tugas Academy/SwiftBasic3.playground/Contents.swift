//CONDITIONALS
//------Format---------
/*
if have snacks, my feeling is happy
else, my feeling is sad */
//------Format---------
/*
if haveSnacks {
   myFeeling = "happy"
}
else {
   myFeeling = "sad"
}*/
//------Format---------
/*
if condition {
 //Code if condition TRUE
} else {
 //Code if condition FALSE
}*/
import Foundation

var isHappy: Bool = true//false//true
//isHappy is a boolean, so the value can be TRUE or FALSE

if isHappy {
    print("I'm Happy")
} else {
    print("I need snacks to be happy")
}
print("--------------------------------1")
// Let's try right now another way to write it down
// We can use the operator "==" which means "is equal to"

if isHappy == true {
    print("I'm Happy")
} else {
    print("I need snacks to be happy")
}
print("--------------------------------2")
// We can also use the operator "!=" which means "is Not equal to"

if isHappy != true {
    print("I need snacks to be happy")
} else {
    print("I'm Happy")
}
print("--------------------------------3")
/*
 Multiple cases
 */
// You can try with difrent value
let language: String = "English"

// In this case we will prepare when there can be more than 2 results
if language == "Indonesia" {
    print("Salam Kenal")
}
else if language == "English" {
    print("Nice to meet You")
}
else if language == "Jawa" {
    print("Piye kabare")
}
else {
    print("Please select the Language !")
}
print("--------------------------------4")
/*
 Multiple condition at the same time
 */

let loveSpicy: Bool = false
let foodisSpicy: Bool = true

if loveSpicy == false && foodisSpicy == true {
    // Here is the result when the food is NOT spicy but the result doesn't like spicy
    print("The food is too spicy 🌶🔥")
} else if loveSpicy == true && foodisSpicy == false {
    // Here is the result when the food is NOT spicy but the person loves spicy
    print("The food has no taste ☹️")
} else {
    // And here it is the default case:
    //     -when the food is NOT spicy and the person does NOT love spicy
    //     -when the food is spicy and the person loves spicy
    print("The food is just perfect 😋")
}
print("--------------------------------5")

let numbr = [1,2,3,4,5]
let text = ["Nana","Marlo","Mangala","Johan","Leo"]
//for i in 0...4{
if numbr.contains(3){//langsung tanpa perulang langsung mengecek
    print("ada angka 3")
    }/*else if text[i] == "Mangala" {
        print("Mangala Hadir")
    }*/
//} jika menggunakan for akan menghasilkan perulang sebanyak 5 kali
print("--------------------------------6")
for i in 0...4 {
    if text[i] == "Mangala" {//memerlukan for karna menggunakan atau bergantung pada variabel "i"
        print("Mangala Hadir")
    }

}//tidak akan melakukan perulang
print("--------------------------------7")
for i in 0...4 {//pengecekan dilakukan oleh perulang
    if numbr[i] == 5 {//Int atau String bisa dengan "for i in 0...4{if var_name[i] == var_value { Statement}}"
        print("ada no 5")
    }
}
print("--------------------------------8")


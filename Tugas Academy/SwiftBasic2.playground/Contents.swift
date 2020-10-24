import Foundation
//ref = https://swift.org

//declare the elements
let myName = "Ilham"// single string
var myFamily = ["Mom","Dad","Bro","Sis","Ilham","Cat"]//list

var myFamilyAge = [45,43,21,19,16,0]
var myAge = 16
var iAmHungry = Bool(false)
//
var test = ["nany"] //var test: String tidak bisa menggunakan ini
var test2 = ["nana","nina","nuna"] //var test:String biasanya digunakan hanya pada single string
//print(test.append(test2))//

//
//Array
/*
 Creating an Empty Array
 you can create an empty array a certain type using initializer syntax
 Accessing and Modifying a Set
 You access and modify a set through its mthode and properties.
 */
var myPets: [String] = []
var myFriends = [String]()
print("Hi guys, my name is \(myName), I have \(myFriends.count) friends")//saat data myFriends belum di update
print("-------------------------------------------.1")
// does anyone wants to be my friends?
myFriends.append("Jo") //pengupdatean data myFriends hanya bisa menambah 1 string
print("Now, I have \(myFriends.count) friends")
print("-------------------------------------------.2")
//The first item in the array has an index of 0, not 1. Arrays in Swift are always zero-indexed
//Tambahan
var list = ["nana","marlo","johan"]
print(list)
list.insert("jon", at:2)
print(list)
//
print("-------------------------------------------.x1")
myFamily[0]

/*
 Iterating Over an Array
 You can iterate over the entire set of values in array with the for-in loop
 */

for i in myFamily{//kalau target rangenya menggunakan nama_variabel "i" akan menuju data variabel
    print("I have a family, this is \(i) ")
}//saat variabel yang ingin ditampilkan banyak kita bisa menggunakan print(\(var1[i])\(var2[i]))
print("-------------------------------------------.3")
/*
 Discuss
 1. what is the diffrent with the for 👆🏻 and 👇🏻 ?
 */
for (i,v) in myFamily.enumerated(){//wajib menggunakan vara_name.anumerate()
    print("family no \(i+1), this is \(v)")//i untuk menampilkan angka v menampilkan nilai list
}
print("-------------------------------------------.4")
//syntax dr for in
//pemahaman
for (i,v) in "Syntax".enumerated(){
    print("jumlah : \(i) dan nilai : \(v)")
}
print("-------------------------------------------.x2")
/*
 for - in ______{
 }
 */

for _ in 0...2 {//seharusnya ada notice kalau kita tulis "i" pada for i in 0...2
    //Block of code to be repeated
    print("Hi")
}
print("-------------------------------------------.5")
//"0...2" on above code is called Range. Try to change it to "0...10". what is the result?
/*
 Discuss
 1. Explain the yellow error notification on line 55 "Immutable value...."
 2. What is the different between yellow erro and error ?
 */
//Creating a loop based on a condition
for i in 0...2 {
    // Using the variable i
    print("i = \(i)")//atau print("i = ",i)
}
print("-------------------------------------------.6")
let minutes = 60
// let's check the meaning of "0...<minutes"
for i in 0..<minutes{//0 sampai kurang dari minutes=60
    print("\(i) secs: I am hungry!")//
}
print("-------------------------------------------.7")
let minuteInterval = 5
for i in stride(from: 0, to: minutes, by: minuteInterval){//menggunakan "stride(from: 0, to: variable target(int), by: variable lompatan)"
    print("\(i) secs")//pada python : for i in range(1,10,2) yang mana memiliki arti dari '1' sampai '10' dengan kelipatan '2'
}
//Dont forget to discuss this with all the class
//Dont hesitate to ask the mentor too

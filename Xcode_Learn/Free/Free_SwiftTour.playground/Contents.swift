//SIMPLE VALUES-------------------------------⭐️⭐️
var myVar = 42
var nilai = myVar * 2
var a = nilai / 4
print(a)

print("-------------------------------------------.1")

let int = 70//automatis Integer
let int1: Int = 70
let dbl = 70.0//automatis Double
let dbl1: Double = 70.0
print("ini Int : \(int) dan ini Double : \(dbl)")//automatis merubah int, double to String

print("-------------------------------------------.2")

let lebel = "panjangnya : "
let angka = 100
let labelAngka = lebel + String(angka)//data type converting
print(labelAngka)//cara 1
print("\(lebel)\(angka) cm")//cara2

print("-------------------------------------------.3")

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."//mencampur str dan int
let fruitSummary = "I have \(apples + oranges) piece of fruit."
print(appleSummary)
print(fruitSummary)

print("-------------------------------------------.4")

let quotation = """
I said "I have \(apples) apples."
And then i said "I have \(oranges + apples) pieces of fruits."
"""//format jika ingin nulis dalam jumlah yang banyak
print(quotation)

print("-------------------------------------------.5")
//[] call "Brackets"
var shoppingList = ["lele","air galon","bunga taik ayam"]//pada python ini list pada swift ini array
print(shoppingList)
shoppingList[1] = "ponari sweat"//mengganti nilai index [1] pada (var shoppingList)
print(shoppingList)

var occupations = [//tipe dictonary
    "Malcolm":"Captain",
    "Kaylee":"Mechanic",//meski tak ada nilai selanjutnya dapat diberikan ","
]//saat di print tidak ada ","
print(occupations)
occupations["Jayne"] = "Public Relations"// cara penambahan dictonary pada awal index [0]
print(occupations)

shoppingList.append("Tahu Walik")
print(shoppingList)

print("-------------------------------------------.6")
// Empty Dictonary and Array
let emptyArray = [String]()
let emptyDictonary = [String: Float]()
print(emptyArray) // hasil []
print(emptyDictonary) // hasil [:]

/*var input = readLine(){
var ipt = Int(input)
print("masukkan nilai : \(ipt)")
}*/
print("-------------------------------------------.7")
//CONTROL FLOW----------------------------⭐️⭐️
let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {// for "index" in "var_array"
    if score > 50 {//bila langsung diberikan variabelnya akan menjadikan Int
        teamScore += 3 //*3=9
    }
    else {
        teamScore += 1 //*2=2 jadi 9+2=11
    }
}
print(teamScore)//diletakkan diluar kurung kurawal agar tidak ikut looping/iterasi
//pemahaman
//var a = "abcde"//tidak dapat digunakan sebagai range array
var htg = 0
for _ in "abcde" {//alternatif (1...5) string sebagai range array
    htg += 2
}
print("5 putaran dengan 2 kali perulangan : \(htg)")
print("-------------------------------------------.8")
//if and let together to work with values that might be missing
//
var optionalString: String? = "Hello"
print(optionalString == nil)//akan menghasilkan false
//INGAT!!!!(==),(=>),(=<) merupakan Boolean yang mana akan menghasilkan statement True and False
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {//jika name = optionalName maka hello "nama" ?? bukannya perlu inputan ya?
    greeting = "Hello \(name)"
}
print("-------------------------------------------.9")
//Switches support any kind of data and wide veriety of comparasion operations they aren't limited to integers and tests for equality
//SWITCH & CASE-----------------------------⭐️
let vegetable = "red papper"
switch vegetable {
case "celery":
   print("Add some raisins and make ants on a log.")
case "cucumber", "watercress"://bisa 2 nilai statement
   print("That would make a good tea sandwich.")
case let x where x.hasSuffix("papper")://hmm??!//mendeteksi akhiran "papper"
   print("Is it a spicy \(x)?")
default:
   print("Everything tastes good in soup.")
}
print("-------------------------------------------.10")

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {//(key:String, value:[Int])
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
print("-------------------------------------------.11")
//WHILE----------------------------------⭐️
var n = 2 //Perkalian pangkat 2
while n < 100 {//saat pada perkalian 64 dan diteruskan 2 kali
    n *= 2     //dan menghasilkan 128 saat itu dia berhenti
}
print("n = 2 dengan kelipatan tiap kali 2 : \(n)")
//repeat while
var m = 2
repeat {
    m *= 2
} while m < 100
print("sama dengan while cuman beda syntax :\(m)")
print("-------------------------------------------.12")
//FOR------------------------------------⭐️
var total = 0
var box = [Int]()//empty array
for i in 0..<4{//0..<4 menghasilkan nilai dibawah nilai 4
    total += i//12345
    box.append(i)
}
print("ini di totalkan \(box)")//iterasi 0..<4 dgn pemberian var +=1
print("sama dengan \(total)")//menghasilkan ini
print("-------------------------------------------.13")
//FUNCTIONS AND CLOSURES----------------------⭐️⭐️
func great(person: String, day: String) -> String{//person dan day itu variabel
    return "Hello \(person), today is \(day)"
}
print(great(person: "Ilham", day: "Friday"))//------------
//---
func cmpr(nm: String, Jumlh: Int)-> String{
    return "nama: \(nm), jumlah pesanan: \(Jumlh)"
    //print("nama: \(nm), jumlah pesanan: \(Jumlh)")//tidak bisa menggunakan langsung print
}
print(cmpr(nm:"johan", Jumlh: 5))//-----------------------
//---
func greet2(_ person: String, day: String)-> String{//tanpa menggunakan variabel "_"
    return "Hello \(person), today is \(day)"
}
print(greet2("Ilham", day: "Friday"))//bisa langsung tanpa harus seperti(person: "ilham", day: "Friday")
//---👈🏻SAMPAI DISINI DULU
func calculateStatistics(scores: [Int])-> (min: Int, max: Int, sum: Int) {//scores: [Int] merupakan empty array
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    //tuple to make compound value
    for score in scores {
        if score > max {
            max = score
        }
        else if score < min {
            min = score
        }
        sum += score
    }
    return (min,max,sum)
}
let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics.sum)//---------------------------------
//Prints "120"
print(statistics.2)//-----------------------------------
//Prints "120"
//------------------------------------------------------
print("-------------------------------------------.14")
//nested function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5//cuman penambahan 5 sekali
    }
    add()
    return y
}
print(returnFifteen())// hasil 15
//------------------------------------------------------
func makeIncrementer() -> ((Int)->(Int)) {
    func addOne(number: Int) -> Int {
        return 1 + number//sama dengan fungsi dalam python
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))// hasil 8
print("-------------------------------------------.15")
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool{
    for item in list {
        if condition(item) {
            return true
        }
    }
        return false
}
    func lessThanTen(number: Int) -> Bool{
        return number < 10
}
let numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
//-----------------------------------------------------
numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
//Print "[60, 57, 21, 36]"

let sortedNumbers = numbers.sorted { $0 > $1}
print(sortedNumbers)
//Prints "[20, 19, 12, 7]"
print("-------------------------------------------.16")
//OBJECT AND CLASSES---------------⭐️⭐️
//Use class following by the class's name to create a class. A property declaration
//in a class is written the same way as a constant or variable declaration, except
//that it is in the context of a class. Likewise, methode and function declarations are
//written the same way
class Shape {// bukan case man class
    var numberOfSides = 0//deklarasi dalam kelas
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }//class ini ngga ada initnya
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription)
// class mirip dengan pemanggilan library pada python bedanya ini masih dalam satu playground
//---------------------------------------------------
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var namaBentuk: NamedShape = NamedShape(name: "john")// harus di inisialisasi lagi tuk ngeprint
print(namaBentuk.name)
print(namaBentuk.simpleDescription())
//var bentuk = NamedShape()
//bentuk.numberOfSides = 5
//var
//--------------------------------------------------
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String){//???
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
}
    func area() -> Double {
        return sideLength * sideLength
}
    override func simpleDescription() -> String {//???
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())
//--------------------------------------------------
print("-------------------------------------------.17")

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue/3.0
        }
}

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
}
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
print("-------------------------------------------.18")

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
//-----------------------------------------------
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optinal square")
let sideLength = optionalSquare?.sideLength
//ENUMERATIONS AND STRUCTURES
//PROTOCOLS AND EXTENSIONS
//ERROR HANDLING
//GENERICS

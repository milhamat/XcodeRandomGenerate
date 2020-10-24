var pi: Double // pada swift ("var nama_variable: data_type = data")
pi = 3.14
var a = Int(pi)
print(pi)// saat Double
print(a)// saat di convert ke Int
var huruf: String = "nana"
//var hrang = Int(huruf)// tidak bisa kalau mau menghitung pakai for
print(huruf)
print("--------------------------------------------------1")
//print(hrang)//ngga bisa paling nanti dibilang nil or no value
let minValue = UInt8.min ; print(minValue)// 0
let maxValue = UInt8.max ; print(maxValue)// 255
let maxVal32 = UInt32.max; print(maxVal32)// 4294967295
let maxVal64 = UInt64.max; print(maxVal64)// 18446744073709551615
//UInt = Unisigned integer type, Use UInt only when you specifically need an unsigned integer type with the same size as the platform's native word size. if this isn't the case, Int is preferred, even when the values to be stored are known to be nonnegative. A consistent use of Int for integer values aids code interoperability, avoids the need to convert between different number types, and matches integer type inference, as describe in "Type Safety and Type Interface"
print("--------------------------------------------------2")
let phi = 3.14159 // pi is inferred to be of type Double
let decimalInteger = 17; print(decimalInteger)// 17
let binaryInteger = 0b10001; print(binaryInteger)// 17 in binary notation
let octaInteger = 0o21; print(octaInteger)// 17 in octal notation
let hexadecimalInteger = 0x11; print(hexadecimalInteger)// 17 in hexadecimal notation
print("--------------------------------------------------3")
let expTwoplus = 1.25e2; print(expTwoplus)// 125.0
let expTwominus = 1.2e-2; print(expTwominus)// 0.012
print("--------------------------------------------------4")
let decimalDouble = 12.1875; print(decimalDouble)// 12.1875
let exponentDouble = 1.21875; print(exponentDouble)// 1.21875
let hexadecimalDouble = 0xC.3p0; print(hexadecimalDouble)// 12.1875

// cannotBeNegative: UInt8 = -1// UInt8 cannot store negative numbers, and so this will report an error
//let tooBig: Int8 = Int8.max + 1// Int8 cannot store a number larger than its maximum value,
//and so this will also report an error
print("--------------------------------------------------5")
let twoThousand: UInt16 = 2_000; print(twoThousand)// 2000
let one: UInt8 = 1; print(one)// 1
let twoThousandAndOne = twoThousand + UInt16(one); print(twoThousandAndOne)// 2001
print("--------------------------------------------------6")
let three = 3; print(three)// 3
let pointOneFourOneFiveNine = 0.14159; print(pointOneFourOneFiveNine)// 0.14159
let pai = Double(three) + pointOneFourOneFiveNine; print(pai)// 3.14159

//TYPE ALIASES⭐️⭐️
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
print("--------------------------------------------------7")

//BOOLEANS⭐️⭐️
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious{
    print("Mmm, tasty turnips!")
}
else {
    print("Eww, turnips are horrible.")
}

let i = 1
if i == 1 {
    //this example will compile successfully
    print("satu ya satu 😂")
}
print("--------------------------------------------------8")

//TUPLES⭐️⭐️
let http404Error = (404,"Not Found");print(http404Error)// gini cara membuat tuple pada swift
//pada tuple perlu penggunaan () tanda kurung bukan {} bukan []
let (statusCode, statusMassage) = http404Error// cara menampilka dua tuple
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status massage is \(statusMassage)")
// Print "The status massage is Not Found"
//  ---------------PEMAHAMAN---------------
var tup = (22,"ILHAM")
var (umur, nama) = tup
print("umur saya \(umur)")
print("nama saya \(nama)")
//-----------------------------------------
let(justTheStatusCode, _) = http404Error// if you only need some of tuple values, ignore part of the tuple with an underscore(_)
print("The status code is \(justTheStatusCode)")
// Print "The status code is 404"

//Alternatively, access the individual element values in a tuple using index numbers starting at zero:
print("The status code is \(http404Error.0)")
// Print "The status code is 404"
print("The status massge is \(http404Error.1)")
// Print "" The status massage is Not Found"
//----------------------PEMAHAMAN-------------
print("umur saya \(tup.0)")// format printnya ("String \(namavar_tupl.index)")
print("nama saya \(tup.1)")
//--------------------------------------------
let http200Status = (statusCode: 200, description: "OK")
// if we name the alement in tuple, you can use the element names to access the values of those elements:
print("The status code is \(http200Status.statusCode)")
// Print "The status code is 200"
print("The status massage is \(http200Status.description)")
//-------------PEMAHAMAN-------------------
var tupl = (nama: "ilham", umur: 70)//pemberian ini sial di tuple
print("umur saya \(tupl.umur)")// format printnya ("String \(namavar_tupl.nama_inisial_tupl)")
print("nama saya \(tupl.nama)")
print("--------------------------------------------------8")

//OPTIONALS⭐️⭐️
//you use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn't a value at all
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

//NIL⭐️⭐️
//you set an optional variable to a valueless state by assigning it the special value nil:
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value
// NOTE : you can't use nil with non-optional constants and variables. if constant or variable in your code needs to work with the absence of value under certain conditions, always declare it as an optional value of the appropriate type
//if we define an optional variable without providing a default value, the variable is automatically set to nil for you
var surveyAnswer: String?
// surveyAnswer is automatically set to nil
// in swift nil isn't a pointer it's the absence of value of a certain type. Optionals of any type can be set to nil, not just object types.

//IF STATEMENT AND FORCED UNWRAPPING⭐️⭐️
// you can use an if statement to find out whether an optional contains a value by comparing the optional against nil. You perform this comparison with the "equal to" operator (==) or the "not equal to" operator(!=)
if convertedNumber != nil {
    print("convertedNumber contains some integer value")
// Print "convertedNumber contains some integer value."
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}
// Prints "convertedNumber has an integer value of 123"
print("--------------------------------------------------9")

//OPTINAL BINDING⭐️ ⭐️
// you use optinal binding to find out whether an optinal contains a value, and if so, to make that value available as a temporary constant or variable. Optinal binding can be used with if and while statement to check for a value inside an optinal, and to extract that value into a constant or variable, as part of single action
if let actualNumber = Int(possibleNumber) {//bukan == yang bermakna boolean// eits ini convert dari Str ke Int donk // salah satu cara convert data type
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
}else {
    print("The string \"\(possibleNumber)\"could not be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"
/*
 if let constantName = someOptional {
     statements
 }
 */
print("--------------------------------------------------10")
//.1
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100{// deklarasi dan condition jadi satu
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"
//.2 beda dengan yang pertama
if let firstNumber = Int("4") {
    if let secondNumber = Int("42"){
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"

//-------------PEMAHAMAN---------------------
if let nilPertama = Int("3"), let nilKedua = Int("34"), nilPertama < nilKedua && nilKedua < 90 {
    print("\(nilPertama) < \(nilKedua) < 100")
}
//----------------
var hrf = Int("5");print(hrf!)//tanda seru ! dapat menyelesaikan masalah

/*for _ in 0...hrf!{// dengan menggunakan ! bisa merubah String to Int
    print("hai") // ngga bisa dipakai karna var hrf = Int("5");print(hrf!)
}*/
//----------------

//IMPLICITLY UNWRAPPERD OPTIONALS⭐️
let possibleString: String? = "An optional string."// bermakna optional string
let forcedString: String = possibleString! // requires an exclamation mark arti tanda seru
// saat variabel di deklarasi menggunakan tanda "?" dibelakang saat akan dugunakan perlu menggunakan exclamation mark "!"
let assumedString: String! = "An implicity unwrapped optional string"// opsi yang terbuka
let implicityString: String = assumedString // no need for an exclamation mark
// NOTE : if an implicity unwrapped optional is nil and you try to access its wrapped value, you'll trigger a runtime error. The result is exactly the same as if you place an exclamation mark after a normal optional that doesn't contain a value
print("--------------------------------------------------11")
//
if assumedString != nil {
    print(assumedString!)
}
// Prints "An implicity unwraped optional string."

if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicity unwrapped optional string"
// NOTE : Don't use an implicity unwrapped optional when there's a possibility of a variable becoming nil at a later point. Always use a normal optional type if you need to check for a nil value during the lifetime of variabel

//ERROR HANDLING⭐️⭐️
// use error handling to respond to error conditions your program may encounter during execution.
//when a function encounters an error condition, it throws an error. That function's caller can then catch the error and respond appropriately
func canThrowAnError() throws {
    // this function may or may not throw an error
}
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}// propagated = diperbanyak

// A do statement creates a new containing scope, which allows errors to be propagated to one or more catch clauses.
func makeASandwich() throws {
    //....
}// mungkin perlu deklarasi tuk yg dibawah ini
/*do {
    try makeASanwich()
    eatASandwich()//percobaan pada saat error analize
} catch SanwichError.outOfCleanDishes {
    washDishes()// process
} catch SandwichError.missingIngredients(let ingredients){
    buyGroceries(ingredients)//solve section
}*/
print("--------------------------------------------------12")

//ASSERTIONS AND PRECONDITIONS⭐️⭐️
//Assertions and preconditions are checks that happen at runtime. You use them to make sure an essential condition is satisfied before executing any further code. If the Boolean condition in the assertion or precondition evaluates to true, code execution continues as usual. If the condition evaluates to false, the current state of the program is invalid; code execution ends, and your app is terminated.

//DEBUGGING WITH ASSERTIONS⭐️
//You write an assertion by calling the "assert(_:_:file:line:)" function from the Swift standard library. You pass this function an expression that evaluates to true or false and a message to display if the result of the condition is false. For example:
let age = -3 // bbila 0 assert
assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 is not >=0

//If the code already checks the condition, you use the assertionFailure(_:file:line:) function to indicate that an assertion has failed. For example:
// contoh dibawah menandakan keadaan yang penting dan perlunya pengecekan sebelum eksekusi syntax / koding
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A persons's age can't be less than zero.")
}
// penggunaan ASSERTIONS AND PRECONDITIONS digunakan untuk mengecek kondisi penting (Assensial) sebelum melakukan exekusi

//ENFORCING PRECONDITIONS⭐️
//Use a precondition whenever a condition has the potential to be false, but must definitely be true for your code to continue execution. For example, use a precondition to check that a subscript is not out of bounds, or to check that a function has been passed a valid value.
//You write a precondition by calling the "precondition(_:_:file:line:)" function. You pass this function an expression that evaluates to true or false and a message to display if the result of the condition is false. For example:
// In the implementation of a subcript...
var index = -3
precondition(index > 0, "Index must be greater than zero")// meski nilai var index salah akan tetap dieksekusi dan dianggap benar
// penggunaan PRECONDITIONS saat kondisi memiliki potensi untuk salah(false) tapi harus benar(true) dalam exekusinya
// NOTE : If you compile in unchecked mode (-Ounchecked), preconditions aren’t checked. The compiler assumes that preconditions are always true, and it optimizes your code accordingly. However, the fatalError(_:file:line:) function always halts execution, regardless of optimization settings.

//You can use the fatalError(_:file:line:) function during prototyping and early development to create stubs for functionality that hasn’t been implemented yet, by writing fatalError("Unimplemented") as the stub implementation. Because fatal errors are never optimized out, unlike assertions or preconditions, you can be sure that execution always halts if it encounters a stub implementation.

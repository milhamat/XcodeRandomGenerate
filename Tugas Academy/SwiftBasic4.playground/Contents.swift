//func functionName(){
    //Code inside the function
//}
//func functionName(parameterName: DataType){
    // Code inside the function
//}
//functionName(parameterName: "value we want to send")
//EXAMPLE
func quickIntroducetion(name: String, age: Int){
    print("Hello, my name is\(name) and i'm \(age) yo")
}

quickIntroducetion(name: "Agathe", age: 81)// result: Hello, my name is Agatha and i'm 81 yo
quickIntroducetion(name: "Gerson", age: 19)// result: Hello, my name is Gerson and i"m 19 yo

print("------------------------------------1")

func test(name: String) {//jika langsung dengan print tanpa menggunakan ->String
    print("nama saya \(name)")
}

func test2(name: String)-> String {//saat menggunakan return perlu diperjelas dengan ->String
    return "nama kamu \(name)"
}

func test3(){//function tanpa parameter
    print("Hallo World")
}

test(name: "Marlo")
print(test2(name: "Tejo" ))
test3()
print("------------------------------------2")
func test4(name: String, age: Int, Emot: String){
    //var 👩🏻‍🦳 = "Female"
    //var 👱🏻‍ = "Male"
    print("Name : \(name)")
    print("Age : \(age)")
    print("Emoticon : \(Emot)")
}

test4(name: "Johan", age: 22, Emot: "👱🏻‍♂️")
print("------------------------------------3")

func test5(){
let Name = ["Rizki","Fitri","John","Mark","Yuni"]
let Age = [21,19,45,59,31]
let Emot = ["male","female","male","male","female"]

for i in 0...4{
    if Emot.contains("male") {
        print("Name: \(Name[i])")
        print("Age: \(Age[i])")
        print("Emoticon: 👱🏻‍ ")
    }
    else if Emot.contains("female"){
        print("Name: \(Name[i])")
        print("Age: \(Age[i])")
        print("Emoticon: 👩🏻‍🦳 ")
    }
}
}
test5()

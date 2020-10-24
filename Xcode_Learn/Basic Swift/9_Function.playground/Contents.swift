//func funcName(parameter)-> retruntype{
     //Statements
//retun parameters
//}
func msg(name: String)-> String {
    let greeting = "Hello" + name
    return greeting//harus sejajar dengan func
}

print(msg(name: " Tejo"))
print(msg(name: " Marlo"))
//----------------------------------------
print("-------------------------------.1")
/* JANGAN LUPAKAN FORMAT
 func funcname() -> datatype {
    return datatype
}
*/
func myFunc() -> String {
   return "hello, world"
}
print(myFunc())
//----------------------------------------
print("-------------------------------.2")
func addition(x: Int, y: Int) -> Int {//dengan return type menggunakan tanda panah
return x+y//akan menghasilkan Integer
}
print(addition(x: 8, y: 10))
//---
func tambah(a: Int, b: Int) -> Int {//wajib menggunakan tanda panah
return a+b //tidak bisa langsung print karna bukan Str
}
//print(tambah(a:10,b:3))
//----------------------------------------
print("-------------------------------.3")
func myFunc(name: String){
print("Hello, \(name)")//tanpa menggunakan return
}
myFunc(name: "Ilham")
//----------------------------------------
print("-------------------------------.4")
/*
 func add(num1:Int,num2:Int){
 }
 add(num1:5,num2:5)
 //Here num1 and num2 refer to the argument values for the num1 and num2 parameter
 */
//---
func smg(first fname: String, last lname: String)->String{
return "Hello, \(fname)\(lname)"
}
print(smg(first:"Peter",last:" Pakar"))
//---
print("-------------------------------.5")
func ssm(_ fname: String, _ lname: String)->String{//'_' digunakan bila variabel tidak dibutuhkan
return "Hello, \(fname)\(lname)"
}
print(ssm("Jhon"," Wikwik"))
//---------------------------------------
print("-------------------------------.6")
func sum(num1:Int,num2:Int=2)->Int{
return num1+num2
}
print(sum(num1:3))
//---
print(sum(num1:3,num2:4))
print("-------------------------------.7")
//----------------------------------------
func student(_ names:String...){//auto membuat list
    for stdNames in names {
    print(stdNames)
    }
}
student("Sila","Bekje")
print("----------")
student("Bob","Marlo","Gohan")
print("-------------------------------.8")
//----------------------------------------
/*var nm1:Int = 1
func changeNm(_ nm:inout Int){
 nm = 3
 print(nm)
 print(nm1)
}
changeNm(&nm1)
*/
//----------------------------------------
func add(a: Int, b: Int)-> Int {
return a+b
}

func multiply(a: Int, b: Int)-> Int {
return a*b
}

func noMsg(){
print("Hello, World")
}

print(add(a:50, b:-30))
print(multiply(a:10, b:2))
noMsg()
print("-------------------------------.9")
//----------------------------------------
func tbh(a: Int, b: Int)-> Int{
return a + b
}

var mathFunction: (Int,Int)-> Int = tbh//mewakili func tbh

print(mathFunction(2,3))
//---
func kalipt(a:Int, b:Int)-> Int{
return a*b
}
var mtkFunction: (Int,Int)-> Int = kalipt//mewakili func kalipt
print(mtkFunction(2,5))
print("-------------------------------.10")
//----------------------------------------
func gsm(){//massage:String
let a = "hello"
    func insideMsg(){
    print(a)
    }
insideMsg()
}
gsm()



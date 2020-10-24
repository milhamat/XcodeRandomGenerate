let str1:String = "Hello saya str1"
let str2:String = String(" Hello saya str2")
let str3 = String("Hello saya str3")
print(str1)
print(str2)
print(str3)
//Swift infer a type of string for the str1 and str2 constant because it's initialized
//with a string literal and string instance value
//------------------------------------------
var emptyStr = ""
var anotherEmptyStr = String()
if emptyStr.isEmpty {
    print("Memang Kosong Borkokok")
}
//------------------------------------------
var tambah = str1 + str2
print(tambah)

var str = "Hello"
str += "ilham"
print(str)
//-----------------------------------------
let nama = "ilham"
var umur = 23 //jangan dikasih petik "" 2 bukan type str
var psn = ("\(nama) is \(umur) years old and another \(umur) years he will be \(umur * 2)")//langsung di print juga boleh
print(psn)
print(nama," is ",umur," years old and another ",umur," years he will be ",umur * 2)//gini juga bisa
//alhamdulillah XD
//----------------------------------------
var Str1 = "Bona Sihombing"
var Str2 = "Iben Sirajaguguk"
var Str3 = "Tomo Gultom"
print("String 1 length is \(Str1.count)")//bukan \(Str1.characters.count)
print("String 2 length is \(Str2.count)")//format :
print("String 3 length is \(Str3.count)")//variable.perintah_bawaan_program
//----------------------------------------
let sTr1 = "abc"
let sTr2 = "abc"
if sTr1 == sTr2 {
    print("Equal !!!")
}
else {
    print("Not Equal !!!")
}
//-----
var Str = "Hai World"
print(Str.hasPrefix("Ha"))
print(Str.hasSuffix("ld"))
//---------------------------------------


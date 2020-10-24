//DICTONARY
//Dictonary stores associations between keys of the same type and value of the same type in a
//collection with no difined ordering
var nums = Dictionary<Int,String>()
print(nums.count)//nga ada nilai variabel
//---
print("---------------------------.1")
var num = [Int: String]()
print(num.count)//nga ada nilai variabel
//---------------------------------
//[key1 : value1, key2 : value2, key3 : value3]
var months:[Int:String] = [1:"jan",2:"feb",3:"mar"]//ex.for Int and String type of value
var month = [1:"Jan",2:"Feb",3:"Mar"]//Shorter form
//---------------------------------
print("---------------------------.2")
let bulan = [1:"Jan",2:"Feb",3:"Mar"]
var getBul1 = bulan[1]
var getBul2 = bulan[2]
var getBul3 = bulan[3]
print(getBul1!)//kapan menggunakan "!" saat print(getBul1!) yang berisikan dictonary
print(getBul2!)
print(getBul3!)
//----pemahaman
print("---------------------------.3")
for i in 1...3 {
    print(bulan[i] as Any)//akan menghasilkan Optinal("Jan")
    //bisa juga "print(bulan[i]!)" menghasilkan Jan {"print(/(bulan[i]))"} hanya digunakan untuk List bukan Dictonary
}
//---------------------------------
print("---------------------------.4")
var bul:[Int:String]=[1:"Jan",2:"Feb",3:"Mar"]
bul[5]="May"
print(bul)
//---
print("---------------------------.5")
bul[2]="Hello"//menggantikan key dan value 2
print(bul)
//---
print("---------------------------")
if let oldVal = bul.updateValue("ABC",forKey: 1) {//menggantikan key dan value 1
    print("Old Value is:\(oldVal)")
}
print(bul)
//---
print("---------------------------.6")
bul[3] = nil//menghilangkan key dan value 3
print(bul)
//---
print("---------------------------.7")
var bula: [Int:String]=[1:"Jan",2:"Feb",3:"Mar"]
if let removedValue = bula.removeValue(forKey: 3){//menghapus dictonary
    print("removed bula:\(removedValue)")
}
else {
    print("Not Exit")
}
print(bula)
//----------------------------------
print("---------------------------.8")
var Bl = [1:"Jan",2:"Feb",3:"Mar"]
for (monthskey,monthValue) in Bl{//menampilkan key dan value
    print("\(monthskey): \(monthValue)")
}
//---
print("---------------------------.9")
for monthskey in Bl.keys{//menampilkan key
    print(monthskey)
}
//---
print("---------------------------.10")
for monthskey in Bl.values{//menampilkan value
    print(monthskey)
}
//---
print("---------------------------.11")
for monthvalue in Bl.values.sorted(){//menampilkan value yang ter sorted
    print(monthvalue)
}
//months.keys.sorted() Correct
//months.values.sorted() Correct
//months.sorted() Wrong
//----------------------------------
print("---------------------------.12")
var dal:[Int:String]=[1:"ABC",2:"Hallo",3:"May"]
print(dal.count)
//---
print("---------------------------.13")
if dal.isEmpty {
    print("Empty")
}
else {
    print("is Not Empty")
}
//----------------------------------
print("---------------------------.13")
//Area experiment
let fal = [1:"Jan",2:"Feb",3:"Mar"]
let list = ["Jan","Feb","Mar"]//iterasi dari 0 jadi pada kali ini 0...2

for i in 1...3 {
    print(fal[i]!)
    //print("bulan \(fal[i]!)")
    //print(list[i])
}
//untuk Dict wajib mengikuti nilai key nya "1"
//untuk List wajib melalui "0"

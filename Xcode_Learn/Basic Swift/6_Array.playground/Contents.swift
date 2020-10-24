//ARRAY
var someInts = [Int]()
var SomeInts = Array<Int>()
//---
var num = [5,2,4,7]
print(num)
//---
var name = ["Sayaya","Ayana","Marlo"]
print(name)
//---
var nums = [Int](repeating: 3, count: 5)
print(nums)
//--------------------------------
var numArray1 = [7,4,13]
var numArray2 = [2,15,22,45]
var gab = numArray1 + numArray2
print(gab)
//--------------------------------
var buah = ["Apple","Mango","Banna","Orange","Lemon"]
var firstItem = buah[0]
print("First Item is \(firstItem)")
print("Second Item is \(buah[1])")
print("Third Item is \(buah[2])")
//--------------------------------
var buahs = ["Apple","Mango","Banana","Orange","Lemon"]
print("Before : \(buahs)")
buahs.append("Salaks")//pasti otomatis menambahkan di belakang
print("After : \(buahs)")
//---
buahs+=["Mangis"]//update disini otomatis penambahan di belakang
print(buahs)
//---
buahs.insert("Duren", at:4)//menambahkan diposisi 4 pada array
print(buahs)
//---
buahs.remove(at:1)//menghapus posisi 1 pada array
print(buahs)
//---
buahs.removeLast()//menghapus posisi akhir
print(buahs)
//---
buahs[1]="Garapes"//menggantikan posisi 1 pada array
print(buahs)
//---
buahs[1...3]=["Apricut","Coconut"]//menggantikan posisi 1 sampai 3 dengan "Apricut" dan "Coconut"
print(buahs)
//-------------------------------
var buahh = ["Mango","Apricut","Coconut"]//itterasi array
for item in buahh {
    print(item)
}
//---
for (index,value) in buahh.enumerated()//pasangan "(index,value) dengan list.anumerated()"
{
    print("Item . \(index+1) : \(value)")
}
//-------------------------------
var fruits = ["Maango","Apricot","Coconut"]
print(fruits.count)
//---
if fruits.isEmpty{
    print("Empty")
}
else {
    print("Not Empty")
}

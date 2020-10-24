//SETS
//Sets contains only uniqe elements of same types with no defined ordering.Sets are used as an
//alternative to array when you wnat to store only unique values and ordering of elements is not an issue

var latters = Set<Character>()
print(latters.count)
//---
print("---------------------------")
var angka: Set = [3,2,3,4,1]
print(angka)
//---
print("---------------------------")
var warna: Set = ["Hijau","Merah","Kuning","Biru","Jinggga"]
print(warna)
//----------------------------------
print("---------------------------")
var number: Set = [2,2,3,4,5,6,7]
print(number.count)
//---
print("---------------------------")
if number.isEmpty {
    print("Set is Empty")
}
else {
    print("Set is not Empty")
}
//---
print("---------------------------")
var color: Set = ["Maroon","Oren","Hitam"]
color.insert("Putih")//akan menambahkan pada posisi awal atau '0'
print(color)
//---
print("---------------------------")
color.remove("Putih")
print(color)
//---
print("---------------------------")
print("is it Maroon in color set ? ")
if color.contains("Maroon") {
    print("Yes")
}
else {
    print("no")
}
//----------------------------------
print("---------------------------")
for item in color {
    print(item)
}
//---
print("---------------------------")
var colors: Set = ["hitam","kuning","pink","hijau","merah"]
for item in colors.sorted() {
    print(item)
}
//----------------------------------
print("---------------------------")
let a: Set = [1,3,9,6,2]
let b: Set = [0,2,5,4,9]
print(a.union(b))
//---
print("---------------------------")
print(a.intersection(b))
//---
print("---------------------------")
print(a.subtracting(b))
//---
print("---------------------------")
print(a.symmetricDifference(b))

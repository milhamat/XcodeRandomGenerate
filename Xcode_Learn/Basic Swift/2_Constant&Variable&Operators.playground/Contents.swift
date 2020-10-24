var name: String
var angka = 100
var str = "i love " + "her"
var a = 0
name = "saya suka kamu"
print(name, angka,"kali")
print(2+2)
print(10-5)
print(100/10," : ",2*5)
print(str,"so much")
print(4%2," : ",5%2)
//------------------------

for _ in 1...5 {//kenapa for _ in bukan for i(variable) in
    a += 3//karna pada penggunaan for kali ini variable i tidak digunakan
    print(a)
}
//---------------

print(2 == 1)
print(2 != 1)
print(2 < 3)
print(3 > 1)
print(2 >= 2)
print(1 <= 2)
//---------------

let nam = "Ilham"
if nam == "Ilham" { //kenapa ada 2 samadengan karna bolean
    print("Hi \(nam)")
}
else{
    print("not Match !!!")
}
//---------------------------

var nilai = 65
nilai = 45
var hasil = (nilai > 50) ? "Lulus" : "Gagal" //samahalnya dengan if
print(hasil)
//-----------

let buah = ["Nanas","Durian","Mangga","Apel","Salak","Semangka"]
let hitung = buah.count
for i in 0..<hitung {
    print(buah[i])
}
//-------------------------

let flag = false //ganti dengan true akan menghasilkan else
if !flag {
    print("Done")
}
else {
    print("Failed")
}
//------------------

let b = true
let c = false
if c && b {//AND
    print("Berhasil")
}
else {
    print("Gagal")
}
//----------------

if c || b {//OR
    print("Berhasil")
}
else {
    print("Gagal")
}
//---------------

if c && b || c || b {
    print("Berhasil")
}
else {
    print("Gagal")
}

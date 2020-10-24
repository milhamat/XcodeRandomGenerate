//data bis adikatakan nil if we define an optional variable without giving a default value, then the variable is automatically set to nil
var name : String?
name = "Marlo"//saat kita memberikan nilai string pada nil value
if name != nil {//apakah name tidak sama dengan tidak memiliki value
print(name!)//force unwarping
print(name)//without force unwarping
}
else {
print("name has nil value")
}
//-------------------
var nim : String!//to unwrap optional value automatically declare variable with (!)
nim = "Tejo"
if nim != nil {
print(nim!)
print(nim)
}
else {
print("name has nil value")
}
//-------------------
var firstname : String?
firstname = "Bob"
if let nam = firstname{
print("first name is \(nam)")
}
else {
print("No Name ")
}
/*
//---------------------
var list = [1,2,3,4,5,6,7,8,9,10]
var htg = list.count
var cnt = 0
for _ in 0..<htg { //kenapa tanpa i karna i tidak digunakan didalam itterasi
    cnt += 1
    
}
print(cnt)*/



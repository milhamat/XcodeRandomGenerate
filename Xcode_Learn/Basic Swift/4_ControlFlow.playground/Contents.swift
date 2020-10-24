var age = 20
if age<18 {
    print("Terlalu Muda")
}
else {
    print("Cukup Umur")
}
//---------------------------
var Score = 70
if Score>85 {
    print("A")
}
else if Score>75 {
    print("B")
}
else if Score>55 {
    print("C")
}
//---------------------------
var num = 11//20,30
switch num {
case 10://dalam kasus penggunaan case harus sesuai dengan nialai
    print("10")//yang telah ditetapkan oleh case
case 20://kalau 10 ya harus sama dengan 10 berbeda dengan penggunaan if
    print("20")
case 30,40:
    print("30")
default:
    print("No Matching")
}
//---------------------------
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
//---------------------------
let names = ["Nana","Danur","Bob"]
for name in names {
    print(name)
}
//---------------------------
var ang = 0
while (ang < 5) {
    //print(ang)//akan menghasilkan 0 sampai 4
    ang+=1
    print(ang)//akan menapilkan 1 sampai 5
}
var a = 0
repeat {
    //print(a)//akan menghasilkan 0 sampai 4
    a += 1
    print(a)//akan menghasilkan 1 sampai 5
} while a < 5//if the numberof itterationis not fixed and you have to execute the loop at least once,
             //then it is recomended to use the repeat-while loop
//--------------------------
for nam  in 1...10 {
    if nam == 5 {
        continue
    }
    print(nam)
}
//--------------------------
for i in 1...10 {
    if i == 8 {
        print(i," . ","Cukup Sampai sini !!!")//tidak menghasilkan itterasi
        break
    }
    print(i)
}
//-------------------------
var nem = 20
switch(nem) {
case 20:
    print("Nem is 20")
fallthrough//the fallthrough keyword simply causes code execution to move directly to the statements inside the next case block
case 30:
    print("Fallthrough automatically even not matched")
//fallthrough
case 40:
    print("Nem is 40")
default:
    print("Default")
}

func loveCalculator() {
    let randomGen = Int.random(in: 1...100)
    
    if randomGen > 80 {
        print(randomGen)
        print("you love each other likes kanye loves kanye")
    }
    
    else if 40 < randomGen {
        print(randomGen)
        print("you can be like coke and mentos")
    }
        
    else {
        print(randomGen)
        print("You are forever ALONE !!!!")
    }
}

loveCalculator()

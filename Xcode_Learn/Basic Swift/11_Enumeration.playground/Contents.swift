enum anumname{
    //enumeration values are describe here
}
/*
 An enumerateion defines a common type for a group
 of related values and enables you to work with those
 values in a type-safe way withing your code
 Syntax:
 keyword enum is used to define enumerated and place
 their definition within a pair of braces{}
 */
enum Days {
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

var day = Days.Monday //Enum.case
print(day)
//----------------------------------------------------
print("-------------------------------------------.1")

enum Colors{
    case Blue
    case Green
    case Red
    case Yellow
}
var color = Colors.Red//ow warna mewakili case dibawah
switch color{
case.Blue:
    print("it's blue")
case.Green:
    print("it's green")
case.Red:
    print("it's red")
case.Yellow:
    print("it's yellow")
}
//---
var warna = Colors.Green//saat diganti Warna.Red tidak bisa mungkin sudah ketetapan?
switch warna{
case .Blue: print("biru")
case .Green: print("hijau")
case .Red: print("merah")
case .Yellow: print("kuning")
}

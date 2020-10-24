var Fams = ["Dad","Mom","Bro","Sis","Iam","cat"]
var Umur = [45,43,28,22,23,1]
var Edu = ["Ph.D","M.Sc","B.Eng","Univ","B.Sc","KinderJoy"]

print("   ---Family Card | Kartu Keluarga---   ")
print("----------------------------------------")
print("No   Member     Age      Education   ")

for i in 1...5 {
    print("----------------------------------------")
    print("\(i). | \(Fams[i])    | \(Umur[i])     | \(Edu[i]) ")
    }
print("----------------------------------------")

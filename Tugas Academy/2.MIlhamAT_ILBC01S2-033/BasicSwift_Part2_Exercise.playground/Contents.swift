//MILHAMAT
//ILBC01S2-033
func test5(){
    let Name = ["Rizki","Fitri","John","Mark","Yuni"]
    let Age = [21,19,45,59,31]
    let Emot = ["male","female","male","male","female"]
    for i in 0...4{
        if Emot[i] == "male" {
            print("| Name: \(Name[i])")
            print("| Age: \(Age[i])")
            print("| Emoticon: 👨🏼‍🦰 ")
            print("+--------------------------+")
            
        }else {
            print("| Name: \(Name[i])")
            print("| Age: \(Age[i])")
            print("| Emoticon: 👩🏻‍🦳 ")
            print("+--------------------------+")
            
        }
        
    }
}
test5()


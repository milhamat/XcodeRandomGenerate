//CLOSURE
/*{(parameter)-> return type in
    //statement
}*/
//Closure sama dengan penggunaan function pada umumnya
//hanya berbeda format dan syntax
func myFunc(_ num:Int)-> Int {
let result = 2 * num
    return result
}
//---
let myClosure = {(_ nam:Int)-> Int in
    let result = 2 * nam
    return result
}
print(myFunc(3))
print(myClosure(3))
print("-------------------------------------------.1")
//----------------------------------------------------
let nums = [2,1,7,3,8,4,11]
let nums1 = [2,6,1,9,3,11]

var sortedNum = nums.sorted(by:{(_ s1:Int,_ s2:Int)-> Bool in
return s1 < s2
})

print(sortedNum)
print("-------------------------------------------.2")
print(nums1.sorted())//bisa juga dengan ini


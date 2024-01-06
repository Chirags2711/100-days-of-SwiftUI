func randArray(arr: [Int]?) -> Int{
    arr?.randomElement() ?? Int.random(in: 1...100)
}

print(randArray(arr: nil))
print(randArray(arr: []))
print(randArray(arr: [1000,2000,4000]))

import UIKit

var dates: [String: Int] = [
    "Mom": 18,
    "Dad": 24,
    "Patty": 21
]

print(dates["Mom", default: 15])
print("Hello")
dates["Tony"] = 6
print(dates["Tony"]!)
print(dates["Jimmy"])
dates.removeValue(forKey: "Tony")
print(dates["Tony"])

var pates: [Int: Int] = [
    1: 2,
    3: 4
]
//print(dates[0])
print(pates[1])

//
// Sets
// Like map (dict) but no key-value pair. only one element per entry
var set = Set<String>()
set.insert("Dish")
set.insert("John")
set.insert("Fred")
set.insert("Cow")
print(set)
set.remove("Dish")
print(set)
print(set.count)

// No duplicates are allowed
var bet = Set([5, 3, 2, 1, 1, 1, 1])
print(bet)

var a = "caribou"
var b = "brouiac"
var sortedA = a.sorted()
var sortedB = b.sorted()
sortedA == sortedB

//
// Enums
//

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.friday
print(day)
var day1 = Weekday.monday
print(day1)

// Checkpoint 2 challenge
print("Challenge")
var arr: [String] = ["word", "cheese", "fred", "timmy", "word", "fred"]
print(arr.count)

var arrToSet = Set(arr)
print(arrToSet.count)

for i in arr {
    print(i)
}

//
// Checkpoint 4
//
enum sqrtError: Error {
    case outOfBounds, noRoot
}

func squareRoot(number: Int) throws -> Int {
    if number <= 1 || number >= 10000 {
        throw(sqrtError.outOfBounds)
    } else {
        for i in 1...100 {
            if i * i == number {
                return i
            }
        }
        throw sqrtError.noRoot
    }
}

var number = 92

// Handle errors
do {
    try squareRoot(number: number)
} catch sqrtError.outOfBounds {
    print("Number is not within the specified bounds")
} catch sqrtError.noRoot {
    print("Number has no valid root")
} catch {
    print("Caught an undefined error")
}

//
// Closures
//

// Copying a function
func greetUser() {
    print("Hello user")
}

var greetCopy = greetUser
greetCopy()

// Closure
let sayHello = {
    print("Hello there")
}

let sayHelloUser = { (name: String) -> String in
    return ("Hello \(name)")
}

print(sayHelloUser("Tim"))

/// Non-dictionary stuff
// Gradients
//         LinearGradient(stops: [
//            .init(color:.mint, location: 0),
//            .init(color:.blue, location: 0.8)
//        ], startPoint: .top, endPoint: .bottom)
//        .ignoresSafeArea()
//        RadialGradient(colors: [.blue, .mint], center: .center, startRadius: 0, endRadius: 250)
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//        Text("Your content")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .background(.blue.gradient)
//        
//        Alert
//        Button("Show alert") {
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("Delete", role: .destructive) { }
//        } message: {
//            Text("Please read this")
//        }
//    }

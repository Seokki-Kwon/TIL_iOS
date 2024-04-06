import UIKit

enum Color: Int, CaseIterable {
    case red, green, blue
}

var color = Color.red
color = .red
color = .green

Color.allCases // [Color]

print(Color.allCases)

var color2 = Color(rawValue: 0)
color2 = Color(rawValue: Int.random(in: 0...2))

for color in Color.allCases {
    print("\(color)")
}

struct SomeView {
//    let colors: [Color] = [.red, .green, .blue]
    let colors = Color.allCases
}

enum CompassDirection: CaseIterable {
    case north, south, east, west
}


print("방향은 \(CompassDirection.allCases.count) 가지")

// 고차함수 이용 가능
let caseList = CompassDirection.allCases.map({"\($0)"}).joined(separator: ", ")

let randomValue = CompassDirection.allCases.randomElement()


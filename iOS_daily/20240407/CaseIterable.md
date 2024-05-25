# CaseIterable
열거형의 값을 반복이 요소로 만들어주는 프로토콜

```swift
enum Color: Int, CaseIterable {
    case red, green, blue
}

var color = Color.red
color = .red
color = .green

Color.allCases // [Color]

print(Color.allCases)
```
CaseIterable 프로토콜 채택만하면 바로 사용가능

```swift
enum CompassDirection: CaseIterable {
    case north, south, east, west
}


print("방향은 \(CompassDirection.allCases.count) 가지")

// 고차함수 이용 가능
let caseList = CompassDirection.allCases.map({"\($0)"}).joined(separator: ", ")

let randomValue = CompassDirection.allCases.randomElement()
```
.allCases를 사용하면 해당 열거형의 값들을 배열형태로 반환해준다. 배열을 활용한 모든 메서드가 활용이 가능해서 유용하게 쓰인다.

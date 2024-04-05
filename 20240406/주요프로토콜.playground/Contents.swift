import UIKit

//let num1: Int = 123
//let num2: Int = 456

//num1 == num2 // Equtable
//num1 != num2 // Equtable
//
//num1 > num2 // Comparable
//num1 < num2 // Comparable

// Comparable 프로토콜은 less than < 메서드를 구현해야한다.
enum Direction: Equatable, Comparable {
    case east
    case west
    case north
    case south
}

Direction.north < Direction.east // Comparable 프로토콜을 채택해야함

// Equatable 프로토콜을 채택하지 않아도 알아서 자동으로 내부구현을 해준다.(연관값x)
Direction.north == Direction.east
Direction.north == Direction.west


// 연관값이 Equtable을 채택한 상태라면 Equtable 프로토콜만 채택한다면 비교연산이 가능하다.
// static func == 자동구현
enum SuperComputer: Equatable {
    case cpu(core: Int, ghz: Double)
    case ram(Int)
    case hardDisk(gb: Int)
}

SuperComputer.cpu(core: 8, ghz: 3.5) == SuperComputer.cpu(core: 16, ghz: 3.5)
SuperComputer.cpu(core: 8, ghz: 3.5) != SuperComputer.cpu(core: 8, ghz: 3.5)

// 구조체를 비교하려는경우 반드시 Equtable 프로토콜을 채택해야한다.
struct Dog {
    var name: String
    var age: Int
}

// Equatble 프로토콜을 채택하기만 해도 내부적으로 자동으로 구현을 해준다.
// 단 모든 저장속성이 Equtable 프로토콜을 채택한 경우에만
extension Dog: Equatable {
    
}

let dog1: Dog = Dog(name: "초코", age: 10)
let dog2: Dog = Dog(name: "보리", age: 2)


dog1 == dog2
dog1 != dog2

// 클래스는 반드시 메서드를 직접 구현해줘야한다(항등연산자)
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name < lhs.name
    }
    
    // 이름, 나이에 따라서 비교하는 논리
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == lhs.name && lhs.age == lhs.age
    }
}

// Hashable
// 숫자/텍스트 -> Hash함수 -> 고정된 길이의 숫자 or 텍스트 고유값

let num1: Int = 123
let num2: Int = 456

let set: Set = [num1, num2] // Where Element == Hashable(Hashable한 요소만 가능)

num1.hashValue // hashValue는 현재 Deprecated

// Hashable 프로토콜의 요구사항
//func hash(into: hasher: inout Hasher) 메서드의 구현

// 열거형, 구조체, 클래스의 Hashable 사용
// hash(into) 함수를 구현
// 구조체 또는 열거형의 경우 Hashable을 채택하면 자동구현(연관값이 Hashable한경우)

// 구조체
struct Dog2 {
    var name: String
    var age: Int
}

extension Dog: Hashable {
    func hash(into hasher: inout Hasher) {
        // 값의 유일성을 해당 속성으로 보장
        hasher.combine(name)
        hasher.combine(age)
    }
}

// 클래스
class Person2 {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person2: Hashable {
    static func == (lhs: Person2, rhs: Person2) -> Bool {
        lhs.name == lhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        // 값의 유일성을 해당 속성으로 보장
        hasher.combine(name)
        hasher.combine(age)
    }
}



# keyPath

## keyPath 배경지식
keyPath는 객체의 특정 속성에 접근하기 위해서 생긴 개념이다. Pesron 객체의 name 속성에 접근할떄 Person.name 이 아닌 다른 방식으로 속성에 접근이 가능하다. Objective-c 방식에서 #keyPath는 특정 객체의 속성에 접근하기 위해 존재하는 개념이다. 비슷한 예로 특정 메서드의 주소에 접근하기 위한 #selector도 있다.

### Swift 방식
```swift
class School {
    var name: String
    var affiliate: SmallSchool
    init(name: String, affiliate: SmallSchool) {
        self.name = name
        self.affiliate = affiliate
    }
}

class SmallSchool {
    var classMember: Person
    init(classMember: Person) {
        self.classMember = classMember
    }
}

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let person1 = Person(name: "홍길동")
let smallSchool = SmallSchool(classMember: person1)
let school = School(name: "슈퍼고", affiliate: smallSchool)

let gildongName = school.affiliate.classMember.name
```
name 속성에 접근하기 위한 일반적인 방식

keyPath 선언
```swift
let namePath = \School.affiliate.classMember.name // keyPath 선언
school[keyPath: namePath] // keyPath를 이용하여 접근
```

### Objective-c 방식
```swift
class Person2: NSObject {
    @objc var name: String
    init(name: String) {
        self.name = name
    }
}
```
NSObject: Objective-c 객체
@objc를 변수앞에 추가하여 Objective-c 방식으로 사용

keyPath 사용
```swift
// Objective-C 방식
person2.value(forKey: "name") // Person2의 name에 접근
person2.value(forKeyPath: #keyPath(Person2.name)) // 변경된 방식(컴파일러가 에러를 잡아줌)

```

경로추가
```swift
let newPath = namePath.appending(path: \.name)
```
appending 메서드를 이용하여 경로추가도 가능하다.

## selector
메서드의 메모리 주소를 가리키기 위해서 사용
```swift
import UIKit

class Dog: NSObject {
    var num = 1.0
    
    @objc var doubleNum: Double {
        get {
            return num * 2
        }
        set {
            num = newValue / 2.0
        }
    }
    
    @objc func run() {
        print("강아지가 달립니다.")
    }
}

let eyesSelector = #selector(getter: Dog.doubleNum)
let nameSelector = #selector(setter: Dog.doubleNum)

// Selector 타입
let runSelector = #selector(Dog.run)
```

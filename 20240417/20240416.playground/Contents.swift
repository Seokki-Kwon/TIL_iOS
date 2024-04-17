import UIKit

// keyPath 개념의 출발

class Dog {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let dog1 = Dog(name: "초코")
dog1.name // 기존 접근방식

"dog1.name" // 문자열로는 접근할 수 없을까? 라는 생각이 keyPath의 시작

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

let gildongName = school.affiliate.classMember

// 미리 경로를 만들어둠
// ReferenceWritableKeyPath<School, String>
// 참조타입의 keyPath 타입
let namePath = \School.affiliate.classMember

// keyPath를 이용한 접근
// keyPath를 이용하면 KVO를 통해서 이름이 변경되면 알림을 받을 수 있음.
school[keyPath: namePath]

class Person2: NSObject {
    @objc var name: String
    init(name: String) {
        self.name = name
    }
}

let person2 = Person2(name: "임꺽정")
person2.name

// Objective-C 방식
person2.value(forKey: "name") // Person2의 name에 접근
person2.value(forKeyPath: #keyPath(Person2.name)) // 변경된 방식(컴파일러가 에러를 잡아줌)

// 경로추가
let newPath = namePath.appending(path: \.name)

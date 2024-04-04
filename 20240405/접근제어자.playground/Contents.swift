import UIKit

// private 이용시 잘못된 접근을 방지할 수 있음.
class SomeClass {
    private var name = "이름"
    
    func nameChange(name: String) {
        if name == "길동" {
            return
        }
        self.name = name
    }
}

let object1 = SomeClass()
//object1.name = "홍길동" // private 설정시 이름 바꾸기 불가능


/**
 접근수준(Access Levels)
 - 1) open - 다른 모듈에서 접근가능 / 상속 및 재정의 가능(제한 낮음)
 - 2) public - 다른 모듈에서도 접근가능(상속/재정의불가)
 - 3) internal - 같은 모듈 내에서만 접근가능(디폴트)[기본]
 - 4) fileprivate - 같은 파일 내에서만 접근가능
 - 5) private - 같은 scope 내에서만 접근 가능
 
 - 모듈(module): 프레임워크, 라이브러리, 앱 등 import 해서 사용할 수 있는 외부의 코드
 */

// 접근 제어를 가질 수 있는 요소는
// 1) 타입(클래스/구조체/스위프트 기본타입)
// 2) 변수/속성

// 모듈이란 - 내가만든 단위
// 나또는 다른사람이 만든앱, Foundation(프레임워크)
// 내가만든 다른사람들이 다른 코드를 사용하기 위해서 public 이상의 수준으로 선언해야함
// public(상속/재정의 불가능), open(상속 재정의 가능)

// 접근제어가 필요한 이유
// 코드 은닉화 가능
// 컴파일 시간 단축

// 접근제어의 기본 원칙
// some = internal, String = public
// 타입은 타입을 사용하는 변수(속성)나, 함수(메서드)보다 높은 수준으로 선언되어야함.
// some = open, String = public 불가능
var some: String = "접근가능"

// 실무에서 사용하는 관습적인 패턴(예전)
class SomeOtherClass {
    private var _name = "이름" // 쓰기 - private
    
    var name: String {
        return _name
    }
    
    func changeName(name: String) {
        self._name = name
    }
}

let a = SomeOtherClass()
a.changeName(name: "바꾼이름")

// 최근방식
class SomeAnotherClass {
    // 읽기 - public, 쓰기 - private
    public private(set) var name = "이름" // private설정(set)
}

let ab = SomeAnotherClass()
ab.name

// 커스텀타입 접근제어
// 타입의 내부 멤버는 타입 자체의 접근 수준을 넘을 수 없음

public class SomePublicClass {
    open var someOpenProperty = "SomeOpen" // public으로 작동
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    fileprivate var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}

let somePublic = SomePublicClass()
somePublic.someInternalProperty
somePublic.someFilePrivateProperty
somePublic.someOpenProperty
//somePublic.somePrivateProperty // 접근불가

// 클래스 자체를 private 선언시 -> fileprivate으로 동작
// 클래스 자체를 pirvate 선언의 의미가 없음
private class SomePrivateClass {
    open var someOpenProperty = "SomeOpen" // public으로 작동
    public var somePublicProperty = "SomePublic"
    var someInternalProperty = "SomeInternal"
    fileprivate var someFilePrivateProperty = "SomeFilePrivate"
    private var somePrivateProperty = "SomePrivate"
}

fileprivate let somePrivate = SomePrivateClass() // fileprivate 으로 동작

open class SomeOpenClass {
    var someProperty = "SomeInternal" // internal open으로 명시적으로 선언해야함
}

// 상속과 확장의 접근 제어

public class A {
    fileprivate func someMethod() {}
}

// public 이하로 선언해야함
// 더 낮은 접근수준으로 선언
internal class B: A {
    override internal func someMethod() { // 접근 수준 올려서 재정의 가능
        super.someMethod() // (더 낮아도) 모듈에서 접근가능하기 떄문에 호출가능
    }
}

// 확장의 접근 제어
public class SomeExtensionClass {
    private var somePrivateProperty = "somePrivate"
}

extension SomeExtensionClass {
    func somePrivateControlFunction() {
        somePrivateProperty = "접근가능" // private 이지만 접근이 가능하다
    }
}

// 설정가능한 속성(setter)
struct TrackedString {
    internal private(set) var numberOfEdits = 0 // 읽기는 가능 쓰기는 불가능하도록 선언
    
    var value: String = "시작" {
        didSet {
            numberOfEdits += 1
        }
    }
}

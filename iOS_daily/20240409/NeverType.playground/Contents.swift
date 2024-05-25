import UIKit

var greeting = "Hello, playground"

// 함수의 리턴 -1) 값의 리턴 + 2) 제어권 리턴
// Never는 값과 제어권을 넘겨주지 않는다.
func addTwoNumbers(a: Int, b: Int) -> Int {
    let c = a + b
    return c
}

var num1 = 5
var num2 = 3

var num3 = addTwoNumbers(a: num1, b: num2) // 함수실행시 제어권을 넘겨줌
print(num3)

// 원래 함수 실행 위치로 제어권을 전달하지 않는다.
func crashAndBurn() -> Never {
    fatalError("앱의 해킹이 발견됨") // 고의적인 에러발생
}

//print("1")
//crashAndBurn()
//print("2")

// Never타입 - Never타입과 함수의 제어권을 Nonereturning
// 빈 열거형으로 선언
// 인스턴스를 생성할 수 없음

// 사용하는 이유
// 런타임중 발생할 수 있는 에러를 발견하고 검증/테스트 하기위함

func someCloseAppSituation() {
    fatalError("앱 해킹시도 흔적 발견")
}

// 디버깅 함수
// assert() -> 디버깅 모드에서 앱이 꺼짐(릴리즈 모드에서는 동작x)
// precondition() -> 릴리즈모드에서도 앱이 꺼짐
// fatalError() -> 모든상황에서 에러발생

// assert(디버그 모드 검증)
func enterWrongValue1() {
    let someWrongInput = -1
    assert(someWrongInput > 0, "유저가 값을 잘못 입력") // 군데군데마다 해당 assert를 추가하여 테스트
}

//enterWrongValue1()

func enterWrongValue2() {
    let someWrongInput = -1
    
    if someWrongInput > 0 {
        
    } else {
        assertionFailure("유저가 값을 잘못 입력")
    }
}

//enterWrongValue2()

// precondition(앱을 출시후에도 의도적으로 앱을 종료)
func appUpdateCheck1() {
    let update = false
    precondition(update, "앱을 업데이트 하지 않음")
}

appUpdateCheck1()

func appUpdateCheck2() {
    let update = false
    
    if update {
        
    } else {
        preconditionFailure("앱을 업데이트 하지 않음")
    }
}


# NeverType

## NeverType
일반적인 함수의 실행흐름은 함수가 실행될때 제어권을 위임받고 함수가 종료되면 리턴값과 제어권을 반환한다. 만약 함수의 타입이 Never타입인 경우 함수의 제어권 또는 값을 반환하지 않고 바로 앱을 종료시킨다.

일반적인 함수
```swift
func addTwoNumbers(a: Int, b: Int) -> Int {
    let c = a + b
    return c
}

var num1 = 5
var num2 = 3

var num3 = addTwoNumbers(a: num1, b: num2) // 함수실행시 제어권을 넘겨줌
print(num3)
```

Never 타입의 fatalError() 메서드
```swift
func crashAndBurn() -> Never {
    fatalError("앱의 해킹이 발견됨") // 고의적인 에러발생
}
```
fatalError 메서드는 그 무엇도 반환하지 않고 앱을 종료시킨다. 생각외로 실무에서 do-catch를 이용하는 에러처리 보다는 앱을 의도적으로 종료시켜서 출시전에 모든 에러를 확인하는 방향으로 앱을 개발한다고한다.

## 검증함수
### assert()
assert() 메서드는 디버그 모드에서 동작하는 에러 검증함수 이다. 릴리즈모드에서 동작하지 않는다.
```swift
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
```

### precondition()
assert보다 조금더 엄격하게 에러를 검증하는 경우 사용한다 디버그, 릴리즈모드 모두 동작한다.
```swift
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
```


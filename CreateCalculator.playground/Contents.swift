import UIKit

/*
// Lv1, Lv2
class Calculator {
    //더하기 함수
    func add(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
    //빼기 함수
    func sub(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
    //곱하기 함수
    func mul(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
    //나누기 함수
    func div(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
    //나머지 함수
    func rem(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)
    }
}

let calculator = Calculator()

let first: Double = 10
let second: Double = 20

print("\(first) + \(second) = \(calculator.add(first, second))")
print("\(first) + \(second) = \(calculator.sub(first, second))")
print("\(first) * \(second) = \(calculator.mul(first, second))")
print("\(first) / \(second) = \(calculator.div(first, second))")
print("\(first) % \(second) = \(calculator.rem(first, second))")
*/

/*
// Lv3
// 상속을 위한 부모 클래스
class Operation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double { // 나눗셈이나 나머지 연산에서 소수점이 나오는 것을 대비하고 float 대비 더 정확한 값이 나왔으면 해서 double로 선언하였습니다
        return 0 // Opertaion이 따로 쓰이지 않고, 오버라이딩 할 부분이므로 기본 반환 값을 0으로 설정해두었습니다
    }
}

// 상속을 통한 각 연산 클래스들의 관계 맺기
// 더하기 클래스
class AddOperation: Operation {
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}
// 빼기 클래스
class SubtractOperation: Operation {
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}
// 곱하기 클래스
class MultiplyOperation: Operation {
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}
// 나누기 클래스
class DivideOperation: Operation {
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}
// 나머지 클래스
class RemainderOperation: Operation {
    override func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)
    }
}

// 구성을 통한 각 연산 클래스와 관계 맺기
class Calculator {
    //인스턴스 생성
    var addOperation: AddOperation
    var subOperation: SubtractOperation
    var mulOperation: MultiplyOperation
    var divOperation: DivideOperation
    var remOperation: RemainderOperation
    
    // 초기화 구문
    init() {
        self.addOperation = AddOperation()
        self.subOperation = SubtractOperation()
        self.mulOperation = MultiplyOperation()
        self.divOperation = DivideOperation()
        self.remOperation = RemainderOperation()
    }
}

// 출력 구현부
let calculator = Calculator()

let first: Double = 14
let second: Double = 10

print("\(first) + \(second) = \(calculator.addOperation.calculate(first, second))")
print("\(first) + \(second) = \(calculator.subOperation.calculate(first, second))")
print("\(first) * \(second) = \(calculator.mulOperation.calculate(first, second))")
print("\(first) / \(second) = \(calculator.divOperation.calculate(first, second))")
print("\(first) % \(second) = \(calculator.remOperation.calculate(first, second))")
*/

//Lv4 추상화 된 AbsrtractOperation 프로토콜 만들기
protocol AbstractOperation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double
} // 추상화를 통해 공통된 인터페이스(calculate)를 정의

class AddOperation: AbstractOperation { // 프로토콜을 따르도록 : AbstractOperation 구문 추가
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

class SubOperation: AbstractOperation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}

class MulOperataion: AbstractOperation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}

class DivOperation: AbstractOperation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        // 0으로 나눌 때의 예외 처리 필요
        return firstNumber / secondNumber
    }
}

class RemOperation: AbstractOperation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)
    }
}

class Calculator {
    var operation: AbstractOperation // 프로토콜을 따르는 인스턴스 생성, 모든 연산에 대한 인스턴스를 생성할 필요 없음
    
    init(parameterOperatin: AbstractOperation) { // 그때 그때 필요한 연산의 인스턴스를 파라미터로 전달 받음
        self.operation = parameterOperatin // 전달받은 인스턴스로 초기화
    }
    
    func performCalculate(_ firstNumber: Double, _ secondNumber: Double) -> Double { // operation 객체에 따라 구체적인 연산을 대신해서 호출하는 메서드
        return operation.calculate(firstNumber, secondNumber) // 연산 수행 후 결과값 반환
    }
}

// 출력 구현부
let firstNumber: Double = 12
let secondNumber: Double = 5

let definedOperation: [AbstractOperation] = [AddOperation(), SubOperation(), MulOperataion(), DivOperation(), RemOperation()] // 파라미터로 전달하기 위한 인스턴스 배열

for currentOperation in definedOperation { // 반복문을 통해 각 연산의 인스턴스를 파라미터로 전달하고 출력할 값 반환 받기
    let calculate = Calculator(parameterOperatin: currentOperation)
    print(calculate.performCalculate(firstNumber, secondNumber))
}

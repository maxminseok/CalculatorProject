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

// Lv3
// 상속을 위한 부모 클래스
class Operation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return 0 // Opertaion이 따로 쓰이지 않고, 오버라이딩 할 부분이므로 기본 반환 값으로 0을 설정해두었습니다
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

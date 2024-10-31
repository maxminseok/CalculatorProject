//
//  Untitled.swift
//  
//
//  Created by t2023-m0072 on 10/31/24.
//

public class Calculator {
    public var operation: AbstractOperation // 프로토콜을 따르는 인스턴스 생성, 모든 연산에 대한 인스턴스를 생성할 필요 없음
    
    public init(parameterOperatin: AbstractOperation) { // 그때 그때 필요한 연산의 인스턴스를 파라미터로 전달 받음
        self.operation = parameterOperatin // 전달받은 인스턴스로 초기화
    }
    
    public func performCalculate(_ firstNumber: Double, _ secondNumber: Double) -> Double { // operation 객체에 따라 구체적인 연산을 대신해서 호출하는 메서드
        return operation.calculate(firstNumber, secondNumber) // 연산 수행 후 결과값 반환
    }
}

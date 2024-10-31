//
//  AddOperation.swift
//  
//
//  Created by t2023-m0072 on 10/31/24.
//

public class AddOperation: AbstractOperation { // 프로토콜을 따르도록 : AbstractOperation 구문 추가
    
    public init() {}
    
    public func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}

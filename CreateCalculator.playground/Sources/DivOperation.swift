//
//  DivOperation.swift
//  
//
//  Created by t2023-m0072 on 10/31/24.
//

public class DivOperation: AbstractOperation {
    public func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        // 0으로 나눌 때의 예외 처리 필요
        return firstNumber / secondNumber
    }
}

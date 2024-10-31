//
//  RemOperation.swift
//  
//
//  Created by t2023-m0072 on 10/31/24.
//

public class RemOperation: AbstractOperation {
    public func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber.truncatingRemainder(dividingBy: secondNumber)
    }
}

//
//  Protocol.swift
//  
//
//  Created by t2023-m0072 on 10/31/24.
//


public protocol AbstractOperation {
    func calculate(_ firstNumber: Double, _ secondNumber: Double) -> Double
} // 추상화를 통해 공통된 인터페이스(calculate)를 정의

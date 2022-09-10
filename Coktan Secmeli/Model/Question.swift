//
//  Question.swift
//  Coktan Secmeli
//
//  Created by Halil Ibrahim Andic on 10.09.2022.
//

import Foundation

struct Question {
    let text: String
    let option: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        option = a
        answer = correctAnswer
    }
}

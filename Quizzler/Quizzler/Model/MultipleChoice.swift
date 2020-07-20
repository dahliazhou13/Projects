//
//  MultipleChoice.swift
//  Quizzler-iOS13
//
//  Created by Doris Zhou on 2020-07-16.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct MultipleChoice {
    let question : String
    let answer : [String]
    let correctAnswer : String
    init(q: String, a: [String], correctAnswer :String){
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}

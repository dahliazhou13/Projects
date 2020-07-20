//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Doris Zhou on 2020-07-15.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct Question{
    let text : String
    let answer : String
    init(q : String, a: String){
        self.text = q
        self.answer = a
    }
}

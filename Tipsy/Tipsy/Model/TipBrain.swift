//
//  TipBrain.swift
//  Tipsy
//
//  Created by Doris Zhou on 2020-07-28.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct TipBrain {
    let amount : Float?
    let percentage : Float?
    let split : Int?
    func getTip() -> Float{
        return amount!*(1+percentage!)/Float(split!)
    }
}

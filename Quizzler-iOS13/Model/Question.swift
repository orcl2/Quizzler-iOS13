//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by William Daniel da Silva Kuhs on 15/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let description: String
    let answare: String
    
    init(q: String, a: String){
        description = q
        answare = a
    }
}

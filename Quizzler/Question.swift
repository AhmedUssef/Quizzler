//
//  File.swift
//  Quizzler
//
//  Created by Ahmed on 4/3/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questiontext : String
    let answer :Bool
    
    init(text :String,correctAnswer:Bool) {
        questiontext = text
        answer = correctAnswer
    }
    
}

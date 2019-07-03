//
//  Question.swift
//  Quizzler
//
//  Created by Hoang Viet on 7/1/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
class Question {
    let questiontext:String
    let answer:Bool
    init(text : String , answerquestion : Bool) {
        questiontext = text
        answer = answerquestion
    }
}

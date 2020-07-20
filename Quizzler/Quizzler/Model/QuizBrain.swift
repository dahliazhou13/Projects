//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Doris Zhou on 2020-07-15.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain{
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

    ]
    let multiple = [
        MultipleChoice(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               MultipleChoice(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
               MultipleChoice(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               MultipleChoice(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               MultipleChoice(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
              MultipleChoice(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               MultipleChoice(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               MultipleChoice(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               MultipleChoice(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
               MultipleChoice(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    var isMultiple = false
    var questionNumber = 0
    var score = 0

    
    mutating func checkAnswer(_ userAnswer : String) -> Bool{
        if(isMultiple){
            if(userAnswer == multiple[questionNumber].correctAnswer){
                score+=1
                nextQuestion()
                return true
            }
            else{
                nextQuestion()
                return false
            }
            
        }
        else{
            if(userAnswer == quiz[questionNumber].answer){
                score+=1
                nextQuestion()
                return true
            }
            else{
                nextQuestion()
                return false
            }
        }
    }
    mutating func nextQuestion(){
        questionNumber += 1
        if self.isMultiple == false && questionNumber == quiz.count{
            self.isMultiple = true
            questionNumber = 0
        }
        if self.isMultiple == true && questionNumber == multiple.count{
            self.isMultiple = false
            questionNumber = 0
            score = 0
        }
    }
    mutating func getText()->String{
        if self.isMultiple{
            return multiple[questionNumber].question
        }
        else{
            return quiz[questionNumber].text
        }
    }
    func getProgress()->Float{
        if(!self.isMultiple){
            return Float(questionNumber+1)/Float((quiz.count+multiple.count))
        }
        else{
            return Float(questionNumber+quiz.count+1)/Float((quiz.count+multiple.count))
        }
        
    }
    func getScore() -> Int{
        return self.score
    }
    func getIsMultiple() -> Bool{
        return self.isMultiple
    }
    func getAnswers() -> [String]{
        return self.multiple[questionNumber].answer
    }
    
}

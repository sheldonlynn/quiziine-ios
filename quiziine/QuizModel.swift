//
//  QuizModel.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-20.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import Foundation

class QuizModel {
    func getQuizzes() -> [[String: Any]] {
        return self.quizzes
    }
    
    func getQuiz(index: Int) -> [String: Any] {
        return self.quizzes[index]
    }
    
    func getQuizCount() -> Int {
        return self.quizzes.count
    }
    
    private let quizzes: [[String: Any]] = [
        [
            "title": "Got Friends?",
            "image": "friends",
            "description": "Are you a Joey or more of a Monica?",
            "questions": [
                [
                    "query": "What's your favourite colour?",
                    "answers": [
                        "Black",
                        "Green",
                        "Blue",
                        "Orange",
                        "Red"
                    ]
                ],
                [
                    "query": "Pick a movie",
                    "answers": [
                        "Titanic",
                        "Armaggedon",
                        "Lion King",
                        "Gentlemen Prefer Blondes",
                        "Black Panther"
                    ]
                ],
                [
                    "query": "Travel Destination?",
                    "answers": [
                        "Germany",
                        "Amsterdam",
                        "Bahamas",
                        "Japan",
                        "New Orleans"
                    ]
                ],
                [
                    "query": "Favourite Book?",
                    "answers": [
                        "The Lifechanging Magic of Tidying Up",
                        "Chicken Soup for the Soul",
                        "The Devil Wears Prada",
                        "Pickup Artist's Guide",
                        "Sports Illustrated"
                    ]
                ],
                [
                    "query": "Best Dog Breed?",
                    "answers": [
                        "Italian Greyhound",
                        "English Sheepdog",
                        "Chihuahua",
                        "Toy Poodle",
                        "Corgi"
                    ]
                ],
            ],
            "answerKey": [
                [
                    "result": "Monica",
                    "image": "monica",
                    "description": "Clean, neat, cool. You're anal retentive just like her!",
                    "cuisine": "sushi"
                ],
                [
                    "result": "Phoebe",
                    "image": "phoebe",
                    "description": "A total free spirit",
                    "cuisine": "vegan"
                ],
                [
                    "result": "Rachel",
                    "image": "rachel",
                    "description": "Rich but still friendly. She's a cool girl!",
                    "cuisine": "chinese"
                ],
                [
                    "result": "Chandler",
                    "image": "chandler",
                    "description": "Self proclaimed ladies man who cracks a funny joke",
                    "cuisine": "burger"
                ],
                [
                    "result": "Joey",
                    "image": "joey",
                    "description": "Funny guy with a quick charm. How handsome.",
                    "cuisine": "pizza"
                ]
            ]
        ],
        [
            "title": "Horoscope Your Life",
            "image": "horoscope",
            "description": "Mercury rising? Time to get hungry.",
            "questions": [
                [
                    "query": "What's your favourite colour?",
                    "answers": [
                        "Black",
                        "Green",
                        "Blue",
                        "Orange",
                        "Red"
                    ]
                ],
                [
                    "query": "Pick a movie",
                    "answers": [
                        "Titanic",
                        "Armaggedon",
                        "Lion King",
                        "Gentlemen Prefer Blondes",
                        "Black Panther"
                    ]
                ]
            ],
            "answerKey": [
                [
                    "result": "Monica",
                    "image": "monica",
                    "description": "Clean, neat, cool. You're anal retentive just like her!",
                    "cuisine": "sushi"
                ],
                [
                    "result": "Phoebe",
                    "image": "phoebe",
                    "description": "A total free spirit",
                    "cuisine": "vegan"
                ],
                [
                    "result": "Rachel",
                    "image": "rachel",
                    "description": "Rich but still friendly. She's a cool girl!",
                    "cuisine": "french"
                ],
                [
                    "result": "Chandler",
                    "image": "chandler",
                    "description": "Self proclaimed ladies man who cracks a funny joke",
                    "cuisine": "burgers"
                ],
                [
                    "result": "Joey",
                    "image": "joey",
                    "description": "Funny guy with a quick charm. How handsome.",
                    "cuisine": "pizza"
                ]
            ]
        ],
        [
            "title": "GOT: Feast Edition",
            "image": "got",
            "description": "A Lannister always eats his food.",
            "questions": [
                [
                    "query": "What's your favourite colour?",
                    "answers": [
                        "Black",
                        "Green",
                        "Blue",
                        "Orange",
                        "Red"
                    ]
                ],
                [
                    "query": "Pick a movie",
                    "answers": [
                        "Titanic",
                        "Armaggedon",
                        "Lion King",
                        "Gentlemen Prefer Blondes",
                        "Black Panther"
                    ]
                ]
            ],
            "answerKey": [
                [
                    "result": "Monica",
                    "image": "monica",
                    "description": "Clean, neat, cool. You're anal retentive just like her!",
                    "cuisine": "sushi"
                ],
                [
                    "result": "Phoebe",
                    "image": "phoebe",
                    "description": "A total free spirit",
                    "cuisine": "vegan"
                ],
                [
                    "result": "Rachel",
                    "image": "rachel",
                    "description": "Rich but still friendly. She's a cool girl!",
                    "cuisine": "french"
                ],
                [
                    "result": "Chandler",
                    "image": "chandler",
                    "description": "Self proclaimed ladies man who cracks a funny joke",
                    "cuisine": "burgers"
                ],
                [
                    "result": "Joey",
                    "image": "joey",
                    "description": "Funny guy with a quick charm. How handsome.",
                    "cuisine": "pizza"
                ]
            ]
        ]
    ]
}

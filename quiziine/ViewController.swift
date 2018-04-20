//
//  ViewController.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-18.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var quizListCollectionView: UICollectionView!
    
    let quizzes: [[String: Any]] = [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set up collection view
        quizListCollectionView.register(UINib.init(nibName: "QuizListCell", bundle: nil), forCellWithReuseIdentifier: "QuizListCell")
        if let flowLayout = quizListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizListCell", for: indexPath) as! QuizListCell
        let quiz = quizzes[indexPath.item]
        cell.title.text = quiz["title"] as? String
        cell.descript.text = quiz["description"] as? String
        cell.image.image = UIImage.init(named: quiz["image"]! as! String)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowQuiz", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuiz" {
            let index = sender as? IndexPath
            let quiz = quizzes[index!.item]
            
            let receiver = segue.destination as! QuizViewController
            receiver.quiz = quiz
        }
    }
}

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}


//
//  QuizViewController.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-18.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var quizTitle: UILabel!
    var quiz: [String: Any]?
    var questions: [[String: Any]]?
    @IBOutlet weak var quizQuestionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = quiz?["questions"] as? [[String: Any]]
        quizTitle.text = quiz?["title"] as? String
        
        quizQuestionCollectionView.register(UINib.init(nibName: "QuizQuestionCell", bundle: nil), forCellWithReuseIdentifier: "QuizQuestionCell")
        if let flowLayout = quizQuestionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = quizQuestionCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizQuestionCell", for: indexPath) as! QuizQuestionCell
        cell.question = questions![indexPath.item]
        cell.questionLabel.text = questions![indexPath.item]["query"] as? String
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

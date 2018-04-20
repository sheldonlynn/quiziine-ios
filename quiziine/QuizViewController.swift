//
//  QuizViewController.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-18.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, SegueDelegate {
    //models
    var quiz: [String: Any]?
    var answerKey: [[String: Any]]?
    var questions: [[String: Any]]?
    var currQuestion: [String: Any]?
    var userAnswers: [Int] = [0, 0, 0, 0, 0]
    var quizResult: [String: String]?
    
    //variables
    var currIdx: Int = 0
    var overlayView: OverlayView!
    
    //outlets
    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = quiz?["questions"] as? [[String: Any]]
        answerKey = quiz?["answerKey"] as? [[String: Any]]
        
        quizTitle.text = quiz?["title"] as? String
        
        displayQuestion()
        
        overlayView = OverlayView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        overlayView.delegate = self
    }
    
    @IBAction func clickAnswer(_ sender: Any) {
        //reached last question
        if (currIdx + 1 >= (questions?.count)!) {
            displayQuizResult()
            return
        }
        
        //increment answer key
        userAnswers[(sender as AnyObject).tag - 1] += 1
        
        nextQuestion()
    }
    
    func displayQuestion() {
        currQuestion = questions?[currIdx]
        questionLabel.text = currQuestion?["query"] as? String
        let answers = currQuestion?["answers"] as? [String]
        
        //create uibutton
        var button: UIButton = UIButton()
        
        for (index, element) in (answers?.enumerated())! {
            //get button by tag
            button = view.viewWithTag(index + 1) as! UIButton
            button.setTitle(element, for: .normal)
        }
    }
    
    func nextQuestion() {
        currIdx += 1
        displayQuestion()
    }
    
    func displayQuizResult() {
        let resultIdx = getResultIdx()
        quizResult = answerKey![resultIdx] as? [String: String]
        
        overlayBlurredBackgroundView()
        
        overlayView.image.image = UIImage.init(named: quizResult!["image"]!)
        overlayView.title.text = quizResult!["result"]
        overlayView.descript.text = quizResult!["description"]
        overlayView.parentController = self
        view.addSubview(overlayView)
    }
    
    func overlayBlurredBackgroundView() {
        let blurredBackgroundView = UIVisualEffectView()
        
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .dark)
        
        view.addSubview(blurredBackgroundView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getResultIdx() -> Int {
        var max = 0
        var index = 0
            
        for (idx, num) in (userAnswers.enumerated()) {
            if (num > max) {
                max = num
                index = idx
            }
        }
        return index
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResult" {
            let receiver = segue.destination as! ResultViewController
            receiver.foodType = quizResult?["cuisine"]
        }
    }
    
    func runSegue(identifier: String) {
        print(identifier)
        self.performSegue(withIdentifier: "ShowResult", sender: self)
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

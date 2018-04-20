//
//  QuizQuestionCell.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-18.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit

class QuizQuestionCell: UICollectionViewCell {
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionLabel: UILabel!
    
    var question: [String: Any]?
    var answers: [String: Any]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 12)
        
        questionLabel.text = question?["query"] as? String
        
//        answers = question?["answers"] as? [String: Any]
        
//        let stackView = UIStackView(arrangedSubviews: createButtons(named: answers!))
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 20
//        stackView.distribution = .fillEqually
//
//        addSubview(stackView)
        
        //constraints
    }
    
    private func createButtons(named: [String: Any]) -> [UIButton] {
        return named.map { answer in
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(answer.key, for: .normal)
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
            return button
        }
    }

}

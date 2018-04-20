//
//  OverlayView.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-19.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//
protocol SegueDelegate {
    func runSegue(identifier: String)
}

import UIKit

class OverlayView: UIView {
    @IBOutlet var contentView: UIView!
    weak var parentController: UIViewController?
    var delegate: SegueDelegate?
    
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var getResult: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "OverlayView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }
    @IBAction func findRestaurant(_ sender: Any) {
        runSegue(identifier: "ShowResult")
    }
    
    @IBAction func goBack(_ sender: Any) {
        runSegue(identifier: "ShowHomeFromQuiz")
    }
    
    func runSegue(identifier: String) {
        delegate?.runSegue(identifier: identifier)
    }
}

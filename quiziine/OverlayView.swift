//
//  OverlayView.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-19.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit

class OverlayView: UIView {
    
    @IBOutlet var contentView: UIView!
    weak var parentController: UIViewController?
    
    @IBOutlet weak var descript: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    @IBOutlet weak var getResult: UIButton!
    
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
    }
    
    func performSegue() {
        let progressViewController = ViewController()
        parentController?.show(progressViewController, sender: nil)
    }
}

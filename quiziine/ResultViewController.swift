//
//  ResultViewController.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-19.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var foodType: String?
    @IBOutlet weak var cuisine: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        cuisine.text = foodType!
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

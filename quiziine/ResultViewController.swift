//
//  ResultViewController.swift
//  quiziine
//
//  Created by Sheldon Lynn on 2018-04-19.
//  Copyright © 2018 Sheldon Lynn. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import SwiftyJSON

class ResultViewController: UIViewController {
    var foodType: String?
    var result: JSON?
    @IBOutlet weak var cuisine: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cuisine.text = foodType!
        getPlace(cuisine: foodType!)
    }
    
    func getPlace(cuisine: String) {
        var url: String
        
        if cuisine != "" {
            url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyAusDburPBCAa473e-6YT_sHs-AJ7ESWNE&location=49.250762,-123.003266&type=restaurant&keyword=\(cuisine)&radius=5000"
        } else {
            url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyAusDburPBCAa473e-6YT_sHs-AJ7ESWNE&location=49.250762,-123.003266&type=food&radius=5000"
        }

        Alamofire.request(url).responseJSON { response in
            if let data = response.data {
                if let json = try? JSON(data: data) {
                    if (json["results"].count == 0) {
                        self.getPlace(cuisine: "")
                    } else {
                        self.result = json["results"][0]
                        print(self.result)
                    }
                }
            }
        }
    }
    
    func getCoordinates() {
        
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

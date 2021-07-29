//
//  RestaurantDetailViewController.swift
//  findIt
//
//  Created by Yarely De La Luz on 7/28/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    var restaurantID:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        yelpButton.imageView?.image = UIImage.yelpLogo()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var yelpButton: UIButton!
    
    @IBOutlet weak var starImage: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

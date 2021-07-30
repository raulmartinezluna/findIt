//
//  RestaurantDetailViewController.swift
//  findIt
//
//  Created by Yarely De La Luz on 7/28/21.
//

import UIKit
import CDYelpFusionKit

class RestaurantDetailViewController: UIViewController {
    var restaurantID:String = ""
    var business: CDYelpBusiness?

    override func viewDidLoad() {
        super.viewDidLoad()
        yelpButton.imageView?.image = UIImage.yelpLogo()
        nameLabel.text = business?.name ?? ""
        restaurantImageView.image = UIImage.yelpStars(numberOfStars: .twoHalf, forSize: .large)
        restaurantImageView.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
        print(business?.name, "detail")
        print(business?.rating)
    }

    @IBOutlet weak var yelpButton: UIButton!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
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

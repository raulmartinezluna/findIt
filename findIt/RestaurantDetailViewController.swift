//
//  RestaurantDetailViewController.swift
//  findIt
//
//  Created by Yarely De La Luz on 7/28/21.
//

import UIKit
import CDYelpFusionKit
import MapKit
import CoreLocation


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
        
        let location = CLLocationCoordinate2D(latitude: business?.coordinates?.latitude ?? 0,longitude: business?.coordinates?.longitude ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
           let region = MKCoordinateRegion(center: location, span: span)
           mapView.setRegion(region, animated: true)
           let annotation = MKPointAnnotation()
           annotation.coordinate = location
        annotation.title = business?.name ?? ""
           mapView.addAnnotation(annotation)
    }

    @IBOutlet weak var mapView: MKMapView!
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

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
import Kingfisher


class RestaurantDetailViewController: UIViewController {
    var restaurantID:String = ""
    var business: CDYelpBusiness?

    override func viewDidLoad() {
        super.viewDidLoad()
        yelpButton.imageView?.image = UIImage.yelpLogo()
        nameLabel.text = business?.name ?? ""
        restaurantImageView.kf.setImage(with: URL(string: business?.imageUrl ?? ""))
        restaurantImageView.contentMode = .scaleAspectFill
        var numberOfStars = CDYelpStars.zero
        switch business?.rating ?? 0 {
        case 0...0.5:
            numberOfStars = CDYelpStars.zero
        case 0.5...1:
            numberOfStars = CDYelpStars.oneHalf
        case 1...1.5:
            numberOfStars = CDYelpStars.one
        case 1.5...2:
            numberOfStars = CDYelpStars.two
        case 2...2.5:
            numberOfStars = CDYelpStars.twoHalf
        case 2.5...3:
            numberOfStars = CDYelpStars.three
        case 3...3.5:
            numberOfStars = CDYelpStars.threeHalf
        case 3.5...4:
            numberOfStars = CDYelpStars.four
        case 4...4.5:
            numberOfStars = CDYelpStars.fourHalf
        case 4.5...5:
            numberOfStars = CDYelpStars.five
        default:
            numberOfStars = CDYelpStars.zero
        }
        reviewButton.setImage(UIImage.yelpStars(numberOfStars: numberOfStars, forSize: .large), for: .normal)
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
    @IBOutlet weak var reviewButton: UIButton!
    
    
    @IBAction func callPressed(_ sender: Any) {
        let phone = business?.phone ?? ""
        guard let number = URL(string: "tel://" + phone) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func webPressed(_ sender: Any) {
        let website = business?.url ?? ""
        guard let site = URL(string: website) else { return }
        UIApplication.shared.open(site)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

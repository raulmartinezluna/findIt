//
//  RestaurantSelectorViewController.swift
//  findIt
//
//  Created by Yarely De La Luz on 7/28/21.
//

import UIKit
import CDYelpFusionKit

class RestaurantSelectorViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblSliderValue: UILabel!
    
    //Buttons Price
    @IBOutlet var priceButtons: Array<UIButton>!
    
    
    
    var business: CDYelpBusiness?
    var yelpID:String = ""
    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        let x = Int(round(sender.value))
        lblSliderValue.text = "\(x)"
        lblSliderValue.center = setUISliderThumbValueWithLabel(slider:sender)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //business = RestaurantFinder.shared.yelpObjects[yelpID]
        //var restaurant = RestaurantFinder.shared.getRestaurant(category: .restaurants, radius: 40000, price: .oneDollarSign, didFinish:())
        //print(restaurant)
    }
    
    
    @IBAction func priceButtonPressed(_ sender: UIButton) {
        print(sender.tag, sender.isSelected)
        sender.isSelected = !sender.isSelected
    }
    
    //App Details
    let ClientID: String = "C0xxAUOOVtQtFGLzE_1xkQ"
    
    //Search - Not Completed -
    let yelpAPIClient = CDYelpAPIClient(apiKey: "H4c-V9MkkqMjxAHQWHHNljdKC8O6v3eUNfkeyXj7c3i7_TLHDJY3gbC9nVuokcXcjnFS9nL8ClSV6eZa885ckdCwEuFWX0uTEkRm3JboUDo_lpceLUYo7F472MH1YHYx")
    @IBAction func findPressed(_ sender: Any) {
        var priceTiers: [CDYelpPriceTier] = []
        if priceButtons[0].isSelected {
            priceTiers.append(.oneDollarSign)
        }
        if priceButtons[1].isSelected {
            priceTiers.append(.twoDollarSigns)
        }
        if priceButtons[2].isSelected {
            priceTiers.append(.threeDollarSigns)
        }
        if priceButtons[3].isSelected {
            priceTiers.append(.fourDollarSigns)
        }
        let x = Int(round(slider.value))
        let yelpDistance = x * 1609
        yelpAPIClient.searchBusinesses(byTerm: nil,
                                       location: "San Francisco",
                                       latitude: nil,
                                       longitude: nil,
                                       radius: yelpDistance,
                                       categories: nil,
                                       locale: .english_unitedStates,
                                       limit: 50,
                                       offset: 0,
                                       sortBy: .rating,
                                       priceTiers: priceTiers,
                                       openNow: true,
                                       openAt: nil,
                                       attributes: nil) { (response) in
          if let response = response,
              let businesses = response.businesses,
              businesses.count > 0 {
            let business = businesses.randomElement()!
            print(business.name)
            self.performSegue(withIdentifier: "restaurantDetail", sender: business)
          }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "restaurantDetail" {
            let dest = segue.destination as! RestaurantDetailViewController
            dest.business = sender as? CDYelpBusiness
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = Int(round(slider.value))
        lblSliderValue.text = "\(x)"
        lblSliderValue.center = setUISliderThumbValueWithLabel(slider:slider)
       
        // Do any additional setup after loading the view.
        //print(RestaurantFinder.shared.getRestaurant(category: .restaurants, radius: 40000, price: .oneDollarSign, didFinish:))
        
    }
    func setUISliderThumbValueWithLabel(slider: UISlider) -> CGPoint {
        let slidertTrack : CGRect = slider.trackRect(forBounds: slider.bounds)
        let sliderFrm : CGRect = slider .thumbRect(forBounds: slider.bounds, trackRect: slidertTrack, value: slider.value)
        return CGPoint(x: sliderFrm.origin.x + slider.frame.origin.x + 29, y: slider.frame.origin.y + 40) }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

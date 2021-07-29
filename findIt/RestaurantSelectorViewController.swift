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

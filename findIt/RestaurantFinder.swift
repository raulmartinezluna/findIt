//
//  RestaurantFinder.swift
//  findIt
//
//  Created by Raul Martinez-Luna on 7/20/21.
//

import Foundation
import CDYelpFusionKit

class RestaurantFinder {
    //Singleton
    static let rFinder = RestaurantFinder()
    
    //App Details
    let ClientID: String = "C0xxAUOOVtQtFGLzE_1xkQ"
    
    //Search - Not Completed -
    let yelpAPIClient = CDYelpAPIClient(apiKey: "H4c-V9MkkqMjxAHQWHHNljdKC8O6v3eUNfkeyXj7c3i7_TLHDJY3gbC9nVuokcXcjnFS9nL8ClSV6eZa885ckdCwEuFWX0uTEkRm3JboUDo_lpceLUYo7F472MH1YHYx")
    //Cuisine, Distance, Rating, Price
    func getRestaurant(category: CDYelpCategoryAlias, radius: Int, rating: Double, price: CDYelpPriceTier) {

        yelpAPIClient.searchBusinesses(byTerm: "Food",
                                       location: "San Francisco",
                                       latitude: nil,
                                       longitude: nil,
                                       radius: radius,
                                       categories: [category, .food],
                                       locale: .english_unitedStates,
                                       limit: 1,
                                       offset: 0,
                                       sortBy: .rating,
                                       priceTiers: [price],
                                       openNow: true,
                                       openAt: nil,
                                       attributes: nil) { (response) in

          if let response = response,
              let businesses = response.businesses,
              businesses.count > 0 {
              print(businesses)
          }
        }
    }
}

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
    static let shared = RestaurantFinder()
    
    var yelpObjects = [String: CDYelpBusiness]()
    //App Details
    let ClientID: String = "C0xxAUOOVtQtFGLzE_1xkQ"
    
    //Search - Not Completed -
    let yelpAPIClient = CDYelpAPIClient(apiKey: "H4c-V9MkkqMjxAHQWHHNljdKC8O6v3eUNfkeyXj7c3i7_TLHDJY3gbC9nVuokcXcjnFS9nL8ClSV6eZa885ckdCwEuFWX0uTEkRm3JboUDo_lpceLUYo7F472MH1YHYx")
    //Cuisine, Distance, Rating, Price
    func getRestaurant(category: CDYelpCategoryAlias, radius: Int, price: CDYelpPriceTier, didFinish: @escaping() -> ()) -> CDYelpBusiness? {

        yelpAPIClient.searchBusinesses(byTerm: nil,
                                       location: "San Francisco",
                                       latitude: nil,
                                       longitude: nil,
                                       radius: radius,
                                       categories: nil,
                                       locale: .english_unitedStates,
                                       limit: 50,
                                       offset: 0,
                                       sortBy: .rating,
                                       priceTiers: [price],
                                       openNow: nil,
                                       openAt: nil,
                                       attributes: nil) { (response) in
          if let response = response,
              let businesses = response.businesses,
              businesses.count > 0 {
            for biz in businesses {
                if let id = biz.id {
                    self.yelpObjects[id] = biz
                    print(id)
                    print(self.yelpObjects[id]?.name)
                }
                else {
                    print("error")
                }
            }
              print(businesses)
          }
        }
        didFinish()
        return self.yelpObjects.values.randomElement()
    }
}

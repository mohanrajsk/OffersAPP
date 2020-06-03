//
//  Offer.swift
//  OffersApp
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import Foundation
struct Offer: Codable {
    let imageName: String
    let offerTittle: String
    
}
struct OffersList: Codable {

    let title: String
    let offers: [Offer]
}


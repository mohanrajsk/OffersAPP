//
//  OfferViewCell.swift
//  OffersApp
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import UIKit

class OfferViewCell: UICollectionViewCell {
    
    // MARK: UIElements
    @IBOutlet weak var offerTittle: UILabel!
    @IBOutlet weak var offerIcon: UIImageView!
    
    // MARK: Properties
    var item: Offer! {
        didSet {
            offerTittle.text = item.offerTittle
            offerIcon.image = UIImage(named: item.imageName)
        }
    }
    
}

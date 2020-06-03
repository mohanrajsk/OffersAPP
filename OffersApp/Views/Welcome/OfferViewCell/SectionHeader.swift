//
//  SectionHeader.swift
//  OffersApp
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import UIKit

let FONT_SIZE: CGFloat = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) ? 20 : 35
class SectionHeader: UICollectionReusableView {
     
    // MARK: UIElements
    var label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .black
         label.font = UIFont.systemFont(ofSize: FONT_SIZE, weight: .bold)
         label.textAlignment = .center
         label.sizeToFit()
         return label
     }()

    // MARK: Instance methods
    override init(frame: CGRect) {
     
        super.init(frame: frame)
         addSubview(label)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
         label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
         label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

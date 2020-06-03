//
//  OfferViewController.swift
//  OffersApp
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import UIKit

let ITEM_SIZE: CGSize = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) ? CGSize(width:100 , height: 160) : CGSize(width:200 , height: 260)
let TOP_SIZE: CGFloat = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) ? 15 : 25

class OfferViewController: UIViewController {
    
    // MARK: UIElements
    @IBOutlet weak var offersCollectionView: UICollectionView!

    // MARK: Variables
    var isPullDown: Bool = false
    let dataSource = OffersDataSource()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    lazy var viewModel: OffersViewModel = {
        let viewModel = OffersViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    // MARK: Lyfcycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }

}

extension OfferViewController {
    
    // MARK: Instance methods
    private func buildUI() {
        
        self.offersCollectionView.register(UINib(nibName: "OfferViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferViewCell")
        self.offersCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        self.offersCollectionView.dataSource = self.dataSource
        self.offersCollectionView.delegate = self.dataSource
        self.viewModel.loadOffers(resourcePath: "CurrentOffers")
        drawGeometricLines()
        
    }

    func drawGeometricLines(){
        
        self.view.layoutIfNeeded()
        offersCollectionView.showsVerticalScrollIndicator = false
        layout.sectionInset = UIEdgeInsets(top: TOP_SIZE, left: 0, bottom: 0, right: 0)
        layout.itemSize = ITEM_SIZE
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        offersCollectionView!.collectionViewLayout = layout
        
    }
    
}

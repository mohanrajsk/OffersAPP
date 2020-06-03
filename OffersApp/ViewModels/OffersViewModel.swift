//
//  OffersViewModel.swift
//  OffersApp
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import Foundation
import UIKit


class OffersViewModel{

    // MARK: Variables
    weak var dataSource: GenericDataSource<OffersList>?
    var title: String!
    
    // MARK: Instance Methods
    init(dataSource: GenericDataSource<OffersList>?) {
        self.dataSource = dataSource
    }
    
    func loadOffers(resourcePath: String) {
        
        if let path = Bundle.main.path(forResource: resourcePath, ofType: "json") {
            
            do {
            
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                if let result = try? JSONDecoder().decode([OffersList].self, from: String(decoding: data, as: UTF8.self).data(using: .utf8) ?? data){
                    self.dataSource?.data.value  = result
                }
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
            
        } else {
            print("Invalid filename/path.")
        }
        
    }
    
}

// MARK: Generic Data Source to use with Datasource and Delegate methods
class GenericDataSource<T>: UICollectionReusableView {
    
    var data: DynamicValue<[T]> = DynamicValue([])
    
}

class OffersDataSource: GenericDataSource<OffersList>, UICollectionViewDelegate , UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.data.value[section].offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : OfferViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferViewCell", for: indexPath) as! OfferViewCell
        cell.item = self.data.value[indexPath.section].offers[indexPath.row]
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader{
            sectionHeader.label.text = self.data.value[indexPath.section].title
            return sectionHeader
        }
        return UICollectionReusableView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
}

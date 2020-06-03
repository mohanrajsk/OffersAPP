//
//  AppDelegate.swift
//  OffersApp
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create a ViewController object with provided xib file name.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = OfferViewController(nibName: "OfferViewController", bundle: nil)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}


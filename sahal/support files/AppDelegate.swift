//
//  AppDelegate.swift
//  sahal
//
//  Created by Fatima Aljaber on 7/15/18.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import UIKit
import Firebase
import DropDown
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let attributes = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Light", size: 30)!]
    let attributes2 = [NSAttributedStringKey.foregroundColor: UIColor.white]
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        DropDown.startListeningToKeyboard()
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9940987229, green: 0.9881885648, blue: 0.9986413121, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.4705882353, green: 0.7254901961, blue: 0.7411764706, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().titleTextAttributes = attributes2
//        let myTabBar = self.window?.rootViewController as! UITabBarController // Getting Tab Bar
//        myTabBar.selectedIndex = 2
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


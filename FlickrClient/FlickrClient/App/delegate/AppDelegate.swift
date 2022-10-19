//
//  AppDelegate.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import UIKit
import Firebase
import FirebaseAuth


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window:UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            FirebaseApp.configure()
                
            
            
                let window = UIWindow(frame: UIScreen.main.bounds)
                
                let viewController = AuthViewController()
                let navigationController = UINavigationController(rootViewController: viewController)
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
                self.window = window
            
            
            
            
                return true
            
            
            //setUpWindow()
            
            
//            return true
        }

    private func setUpWindow() {
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let homeVC = HomeViewController(viewModel: HomeViewModel())
            let homeNav = UINavigationController(rootViewController: homeVC)
            let vcs = [homeNav]
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = vcs
            window.rootViewController = tabBarController
            
            
            
        } else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let viewController = AuthViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            window.rootViewController = navigationController
            
        }
    }

}


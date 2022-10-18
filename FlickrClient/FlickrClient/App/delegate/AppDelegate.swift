//
//  AppDelegate.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window:UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let viewController = HomeViewController(viewModel: HomeViewModel())
            viewController.title = "Home"
            
            
            let navigationController = UINavigationController(rootViewController: viewController)
            let vcs = [navigationController]
           
            let tabbarControlre = UITabBarController()
            tabbarControlre.viewControllers = vcs
            window.rootViewController = tabbarControlre
            window.makeKeyAndVisible()
            self.window = window

            return true
        }

 

}


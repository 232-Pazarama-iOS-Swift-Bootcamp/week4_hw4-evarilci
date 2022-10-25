//
//  TabBarViewController.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 25.10.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViewControllers()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    func setupViewControllers() {
        viewControllers = [
            createNavigationControllers(for: HomeViewController(viewModel: HomeViewModel()), title: "Home", image: UIImage(named: "home")!),
            createNavigationControllers(for: FavViewController(viewModel: FavViewModel()), title: "Favorites", image: UIImage(named: "favorite")!)
        ]
    }
    
    fileprivate func createNavigationControllers(for rootViewController : UIViewController,
                                                 title: String,
                                                 image: UIImage) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationController
        
        
    }
    
    
    
    
}

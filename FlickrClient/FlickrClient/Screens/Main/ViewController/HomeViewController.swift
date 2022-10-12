//
//  HomeViewController.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    let Tabview = mainTableView()
    
    private var viewModel : HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view = Tabview
        Tabview.setTableViewDelegates(delegate: self, datasource: self)
        
    }


}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as! ContentCell
       
        return cell
    }
}


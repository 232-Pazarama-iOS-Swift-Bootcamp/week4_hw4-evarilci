//
//  HomeViewController.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import UIKit
import SnapKit
import Kingfisher


final class HomeViewController: UIViewController {
    let Tabview = mainTableView()
    var response : PhotoResponse? {
        didSet {
            //Tabview.refresh()
            print("controller respponse check")
        }
    }
    
    //let model = [Photos]()
    
    
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
        
        viewModel.fetchPhotos()
        viewModel.statusHandler = { status in
            switch status {
            case .didFetchPhotos:
                self.Tabview.tableView.reloadData()
            case .didErrorOccurred(let error):
                print(error.localizedDescription)
            }
        }
 
    }
}

extension HomeViewController: UITableViewDelegate {
  
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //  return viewModel.recentResponse?.photos?.photo.count ?? 0
        return viewModel.numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as? ContentCell else {
                    fatalError("cell not found")
                }
        
          
        
                guard let photo = viewModel.photoForIndexPath(indexPath) else {
                    fatalError("photo not found!!!!!!!!")
                }
        
        
//                guard let url = URL(string: (photo.url_z!)) else {
//                    fatalError("cant find url")
//
//                }
        
        
                cell.username = photo.ownername
                cell.contentImageView.kf.setImage(with: photo.imageURL) { _ in
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                cell.title = photo.title
    
        
        
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "Cell - \(indexPath.row)"
        return cell
    }
    
}

//
//  HomeViewController.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//
//import SnapKit
import Kingfisher
import UIKit



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
    
    @objc func liked() {
        print("liked")
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") as? ContentCell else {
            fatalError("cell not found")
        }
        guard let photo = viewModel.photoForIndexPath(indexPath) else {
            fatalError("photo not found!!!!!!!!")
        }
        cell.username = photo.ownername
        cell.contentImageView.kf.setImage(with: photo.imageURL) { _ in
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        cell.title = photo.title
        cell.selectionStyle = .none
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeTapped(sender:)), for: .touchUpInside)
        cell.saveButton.tag = indexPath.row
        cell.saveButton.addTarget(self, action: #selector(saveTapped(sender:)), for: .touchUpInside)
      
        return cell
    }
    
    @objc func likeTapped(sender: UIButton) {
        viewModel.addFavorites()
    }
    
    @objc func saveTapped(sender: UIButton) {
        viewModel.addSaved()
    }
}

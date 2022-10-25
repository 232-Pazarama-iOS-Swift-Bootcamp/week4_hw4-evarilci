//
//  FavViewController.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 19.10.2022.
//

import Kingfisher
import UIKit
import Firebase
import FirebaseFirestore



final class FavViewController: UIViewController {
    let Tabview = FavTableView()
    private var viewModel : FavViewModel
    let db = Firestore.firestore()
    var photo : Photo?
        
    init(viewModel: FavViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        view = Tabview
        Tabview.setTableViewDelegates(delegate: self, datasource: self)
        
        viewModel.getData()
        viewModel.statusHandler = { status in
            switch status {
            case .didFetchPhotos:
                self.Tabview.tableView.reloadData()
            case .didErrorOccurred(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getData()
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

extension FavViewController: UITableViewDelegate {
}
extension FavViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as? FavCell else {
            fatalError("cell not found")
        }
        let imageURL = URL(string: viewModel.imagegeURLArray[indexPath.row])
        
        
        cell.title = viewModel.titleArray[indexPath.row]
        cell.username = viewModel.ownerNameArray[indexPath.row]
        cell.contentImageView.kf.setImage(with: imageURL) { _ in
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
    
   
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(button)
        self.present(alert, animated: true)
        
    }
    
    
}

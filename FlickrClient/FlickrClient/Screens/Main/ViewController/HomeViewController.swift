//
//  HomeViewController.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//
//import SnapKit
import Kingfisher
import UIKit
import Firebase
import FirebaseFirestore



final class HomeViewController: UIViewController {
    let Tabview = mainTableView()
    private var viewModel : HomeViewModel
    let db = Firestore.firestore()
    var photo : Photo?
        
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
        let tabBarIcon = UIImage(named: "home")
        tabBarItem = UITabBarItem(title: "Home",
                                  image: tabBarIcon,
                                  tag: .zero)
        
        tabBarController?.navigationItem.hidesBackButton = true
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logOut))

        tabBarController?.navigationItem.rightBarButtonItem = logoutBarButtonItem
        self.navigationItem.rightBarButtonItem = logoutBarButtonItem
        
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
        self.photo = photo
        
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
        guard let id = photo?.id,
        let image = photo?.url_z,
        let owner = photo?.ownername,
        let title = photo?.title else {return}
        db.collection("Liked").document(id).setData([
            "id" : id,
            "imageURL" : image,
            "ownerName" : owner,
            "title" : title,
            "likedBy": Auth.auth().currentUser!.email!
        
        ]) {err in
            if let err = err {
                self.showAlert(title: "Error", message: err.localizedDescription)
            } else {
                print("like succesed")
            }
        }
    }
    
    @objc func saveTapped(sender: UIButton) {
        guard let id = photo?.id,
        let image = photo?.url_z,
        let owner = photo?.ownername,
        let title = photo?.title else {return}
        db.collection("Saved").document(id).setData([
            "id" : id,
            "imageURL" : image,
            "ownerName" : owner,
            "title" : title,
            "savedBy": Auth.auth().currentUser!.email!
        
        ]) {err in
            if let err = err {
                self.showAlert(title: "Error", message: err.localizedDescription)
            } else {
                print("saving succesed")
            }
        }
    }
    
    @objc func logOut(){
        do {
            try Auth.auth().signOut()
            let `self` = self
            let AuthViewController = AuthViewController()
           self.navigationController?.pushViewController(AuthViewController, animated: true)
           
            print("sign out success")
        } catch  {
            print("sign out failed")
        }
    }
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(button)
        self.present(alert, animated: true)
        
    }
    
    
}

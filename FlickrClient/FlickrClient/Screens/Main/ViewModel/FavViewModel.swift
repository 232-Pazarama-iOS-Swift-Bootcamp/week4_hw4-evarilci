//
//  FavViewModel.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 19.10.2022.
//

import Foundation
import Firebase
import FirebaseFirestore


enum FavPhotoStatus {
    case didErrorOccurred(_ error: Error)
    case didFetchPhotos
}


final class FavViewModel {
    
    var statusHandler : ((FavPhotoStatus) -> Void)?
    
    let tableview = FavTableView()
    
    var userEmailArray = [String]()
    var idArray = [String]()
    var imagegeURLArray = [String]()
    var ownerNameArray = [String]()
    var titleArray = [String]()
    
    let db = Firestore.firestore()
    
    func getData(){
        db.collection("Liked").addSnapshotListener { snapshot, err in
            if let err {
                print(err.localizedDescription)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        guard let likedBy = document.get("likedBy") as? String,
                              let id = document.get("id") as? String,
                              let imagegeURL = document.get("imageURL") as? String,
                              let ownerName = document.get("ownerName") as? String,
                              let title = document.get("title") as? String else {return}
                        self.userEmailArray.append(likedBy)
                        self.idArray.append(id)
                        self.imagegeURLArray.append(imagegeURL)
                        self.ownerNameArray.append(ownerName)
                        self.titleArray.append(title)
                    }
                    self.tableview.tableView.reloadData()
                }
            }
            
        }
    }
    
    
    
}

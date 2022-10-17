//
//  HomeViewModel.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import Foundation
import Moya

enum RecentPhotoStatus {
    case didErrorOccurred(_ error: Error)
    case didFetchPhotos
}

final class HomeViewModel {
    
    
    var statusHandler : ((RecentPhotoStatus) -> Void)?
    
    private(set) var recentResponse : PhotoResponse?{
       didSet {
           self.statusHandler?(.didFetchPhotos)
          
       }
   }
     var photo = [Photo]() {
        didSet {
            self.statusHandler?(.didFetchPhotos)
        }
    }
    
   
    
    var numberOfRows: Int {
        recentResponse?.photos?.photo.count ?? 0
    }
    
    func fetchPhotos() {
        provider.request(.recent) { result in
            switch result {
            case .failure(let error):
                self.statusHandler?(.didErrorOccurred(error))
            case .success(let response):
                do {
                     let photoResponse = try JSONDecoder().decode(PhotoResponse.self, from: response.data)
                    self.recentResponse = photoResponse
                    
                } catch {
                    self.statusHandler?(.didErrorOccurred(error))
                    print("error occured")
                }
            }
        }
    }
    
    func photoForIndexPath(_ indexPath: IndexPath) -> Photo? {

        return self.recentResponse?.photos?.photo[indexPath.row]
    }
}

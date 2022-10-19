//
//  searchViewModel.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 19.10.2022.
//

import Foundation
import Moya

enum SearchPhotoStatus {
    case didErrorOccurred(_ error: Error)
    case didFetchPhotos
}

final class SearchViewModel {
    
    
    var statusHandler : ((SearchPhotoStatus) -> Void)?
    
    private(set) var searchResponse : PhotoResponse?{
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
        searchResponse?.photos?.photo.count ?? 0
    }
    
    func fetchPhotos() {
        provider.request(.search) { result in
            switch result {
            case .failure(let error):
                self.statusHandler?(.didErrorOccurred(error))
            case .success(let response):
                do {
                     let photoResponse = try JSONDecoder().decode(PhotoResponse.self, from: response.data)
                    self.searchResponse = photoResponse
                    
                } catch {
                    self.statusHandler?(.didErrorOccurred(error))
                    print("error occured")
                }
            }
        }
    }
    
    func photoForIndexPath(_ indexPath: IndexPath) -> Photo? {

        return self.searchResponse?.photos?.photo[indexPath.row]
    }
    
    
}

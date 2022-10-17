//
//  RecentPhotoResponse.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 13.10.2022.
//

import Foundation

struct PhotoResponse: Decodable {
    let photos: Photos?
    let stat: String?
}

struct Photos: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]
}

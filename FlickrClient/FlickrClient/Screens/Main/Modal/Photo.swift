//
//  RecentPhoto.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 13.10.2022.
//

import Foundation

struct Photo: Codable {
    let id: String?
    let owner: String?
    let secret: String?
    let server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    let ownername: String?
    let url_z: String?
    let height_z: Int?
    let width_z: Int?
    
    
    //    enum CodingKeys: String, CodingKey {
    //        case id
    //        case owner
    //        case secret
    //        case server
    //        case farm
    //        case title
    //        case ispublic
    //        case isfriend
    //        case isfamily
    //        case ownername
    //        case url = "url_c"
    //        case height = "height_c"
    //        case width = "width_c"
    //
    //    }
    
   
}
extension Photo {
    init(from dict: [String: Any]) {
        id = dict["id"] as? String
        owner = dict["owner"] as? String
        secret = dict["secret"] as? String
        server = dict["server"] as? String
        farm = dict["rank"] as? Int
        title = dict["title"] as? String
        ispublic = dict["ispublic"] as? Int
        isfriend = dict["isfriend"] as? Int
        isfamily = dict["isfamily"] as? Int
        ownername = dict["ownername"] as? String
        url_z = dict["url_z"] as? String
        height_z = dict["height_z"] as? Int
        width_z = dict["width_z"] as? Int
        
    }
    
}

extension Photo {
    var imageURL: URL {
        guard let icon = url_z,
              let iconUrl = URL(string: icon) else {
                let icon = "https://www.computerhope.com/jargon/b/black.jpg",
                iconUrl = URL(string: icon)
                return iconUrl!
            }
            return iconUrl
        }
        
    }




//extension Photo {
//    var imageURL: URL {
//        guard let icon = url_z,
//              let iconUrl = URL(string: icon) else {
//            fatalError("icon url not found.")
//        }
//        return iconUrl
//    }
//}

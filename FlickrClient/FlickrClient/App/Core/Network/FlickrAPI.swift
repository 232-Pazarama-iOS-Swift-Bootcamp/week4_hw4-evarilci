//
//  FlickrAPI.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 13.10.2022.
//

import Foundation
import Moya

let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
let provider = MoyaProvider<FlickrAPI>(plugins: [plugin])


enum FlickrAPI {
    
    case recent
    case search
    
    
}

// MARK: - TargetType
extension FlickrAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://www.flickr.com/services/rest") else {
            fatalError("Base URL not found or not in correct format.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .recent:
            return "/"
        case .search:
            return"/"
            
            
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .recent:
            let parameters : [String:Any] = ["method" : "flickr.photos.getRecent" , "api_key":"cb43d0de658a4d9e6cabac4c762c732e","extras":"owner_name,url_z","format":"json","nojsoncallback":1]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .search:
            let parameterss : [String:Any] = ["method" : "flickr.photos.search" , "api_key":"cb43d0de658a4d9e6cabac4c762c732e","text":"","privacy_filter":1,"media":"photos","extras":"owner_name,url_z","format":"json","nojsoncallback":1]
            return .requestParameters(parameters: parameterss, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}


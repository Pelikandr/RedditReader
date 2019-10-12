//
//  APIManager.swift
//  RedditReader
//
//  Created by Maria Holubieva on 08.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

    //var onRecieve: (([FeedItem]?) -> Void)?
    let dataParser = DataParser()

    func getFeedData(completion: ((_ data: [FeedItem]?, _ error: Error?) -> Void)?) {
        var feedItems: [FeedItem]?
        request("https://www.reddit.com/top.json").validate().responseJSON { responseJson in
            switch responseJson.result {
            case .success(let value):
                feedItems = self.dataParser.parse(value)
                completion!(feedItems, nil)
            case .failure(let error):
                completion!(nil, error)
                print(error)
            }
        }
    }
    
//    func getThumbnail(url: String, completion: ((_ image: UIImage?, _ error: Error?) -> Void)?) {
//        request(url).validate().responseData { responseData in
//            switch responseData.result {
//            case .success(let data):
//                guard let thumbnail = UIImage(data: data) else { return }
//                print(thumbnail)
//                completion!(thumbnail, nil)
//            case .failure(let error):
//                completion!(nil, error)
//                print(error)
//            }
//        }
//    }
}

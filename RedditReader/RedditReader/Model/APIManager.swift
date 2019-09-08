//
//  APIManager.swift
//  RedditReader
//
//  Created by Maria Holubieva on 08.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

class APIManager {

//    var onRecieve: ((FeedItem) -> Void)?

    func getFeedData(completion: ((_ data: [FeedItem]?, _ error: Error?) -> Void)?) {

    if let url = URL(string: "https://www.reddit.com/top.json") {
        URLSession.shared.dataTask(with: url) { data, response, error in
                let jsonDecoder = JSONDecoder()
                do {
                    let data = try jsonDecoder.decode(<#T.Type#>)
//                let feedItems: [FeedItem] = try jsonDecoder.decode([FeedItem].self, from: data!)
//                    completion?(feedItems, nil)
                    } catch {
                        print(error.localizedDescription)
                        completion?(nil, error)
                    }
            }.resume()
        }
    }

}

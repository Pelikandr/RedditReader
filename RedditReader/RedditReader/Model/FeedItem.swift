//
//  FeedItem.swift
//  RedditReader
//
//  Created by Maria Holubieva on 08.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

struct FeedItem: Decodable {
    let title: String
    let author: String
    let createdDate: Float
    let commentsNumber: Int
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case title
        case author
        case createdDate = "created"
        case commentsNumber = "num_comments"
        case thumbnail
    }

    init(from decoder: Decoder) throws {
    }
}

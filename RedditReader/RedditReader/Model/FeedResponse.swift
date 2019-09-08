//
//  FeedResponse.swift
//  RedditReader
//
//  Created by Maria Holubieva on 08.09.2019.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

struct FeedResponse: Decodable {
    let children: [FeedItem]

    private enum CodingKeys: String, CodingKey {
        case data
        case children
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        self.children = try nestedContainer.decode([FeedItem].self, forKey: .children)
    }
}

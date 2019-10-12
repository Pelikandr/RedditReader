//
//  ViewController.swift
//  RedditReader
//
//  Created by Denis Zayakin on 9/8/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let apiManager = APIManager()
    private let adapter = FeedAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = adapter
        tableView.dataSource = adapter
        
        tableView.estimatedRowHeight = 400

        apiManager.getFeedData() { (items: [FeedItem]?, error: Error?) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else if let feedItems = items {
                print("DATA: \(feedItems.count) count")
            } else {
                print("ERROR: Unknown")
            }
        }
    }


}


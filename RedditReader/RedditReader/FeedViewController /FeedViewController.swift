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
        apiManager.getFeedData() { (items: [FeedItem]?, error: Error?) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else if let feedItems = items {
                self.adapter.data = feedItems
                self.tableView.reloadData()
                print("DATA: \(feedItems.count) count")
            } else {
                print("ERROR: Unknown")
            }
        }
        tableView.estimatedRowHeight = 400
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        
//        apiManager.getFeedData() { (items: [FeedItem]?, error: Error?) in
//            if let error = error {
//                print("ERROR: \(error.localizedDescription)")
//            } else if let feedItems = items {
//                self.adapter.data = feedItems
//                self.tableView.reloadData()
//                print("DATA: \(feedItems.count) count")
//            } else {
//                print("ERROR: Unknown")
//            }
//        }
//    }


}


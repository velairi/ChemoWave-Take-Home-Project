//
//  CommentsViewController.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    var permalink: String
    var comments = [String?]()

    init(_ permalink: String) {
        self.permalink = permalink
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comments"
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        CommentService.fetchComments(permalink) { [weak self] commentChildren in
            self?.comments = commentChildren.map { $0.data.body }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension CommentsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.separatorInset = .zero
        cell.textLabel?.font = UIFont(name: "Verdana", size: 15)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        cell.textLabel?.text = comments[indexPath.row]
        return cell
    }
}

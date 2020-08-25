//
//  CommentsViewController.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    var commentViewModel = CommentViewModel()
    var permalink: String

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
        commentViewModel.fetchComments(permalink) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension CommentsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentViewModel.comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return commentViewModel.getCommentCell(commentViewModel.comments[indexPath.row])
    }
}

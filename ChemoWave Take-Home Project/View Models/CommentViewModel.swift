//
//  CommentViewModel.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/24/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//
import UIKit
import Foundation

class CommentViewModel {

    var comments = [String?]()

    func fetchComments(_ permalink: String, completion: @escaping () -> Void) {
        CommentService.fetchComments(permalink) { [weak self] commentChildren in
            self?.comments = commentChildren.map { $0.data.body }
            completion()
        }
    }

    func getCommentCell(_ comments: [String?], _ indexPath: IndexPath, _ postTitle: String, _ postImage: UIImage?) -> UITableViewCell {
        if indexPath.row == 0 {
            let topCell = UITableViewCell()
            topCell.separatorInset = .zero
            topCell.textLabel?.font = UIFont(name: "Verdana", size: 20)
            topCell.textLabel?.lineBreakMode = .byWordWrapping
            topCell.textLabel?.numberOfLines = 0
            topCell.textLabel?.text = postTitle
            topCell.imageView?.image = postImage
            return topCell
        } else if indexPath.row == 1 {
            let secondCell = UITableViewCell()
            secondCell.separatorInset = .zero
            secondCell.textLabel?.font = UIFont(name: "Verdana-Bold", size: 17)
            secondCell.textLabel?.lineBreakMode = .byWordWrapping
            secondCell.textLabel?.numberOfLines = 0
            secondCell.textLabel?.text = "Comments"
            return secondCell
        }
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

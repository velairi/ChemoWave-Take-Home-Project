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

    func getCommentCell(_ comment: String?) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.separatorInset = .zero
        cell.textLabel?.font = UIFont(name: "Verdana", size: 15)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        cell.textLabel?.text = comment
        return cell
    }
}

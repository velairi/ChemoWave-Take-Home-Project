//
//  Comment.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import Foundation

// MARK: - CommentElement
struct CommentElement: Decodable {
    let data: CommentData
}

// MARK: - CommentData
struct CommentData: Decodable {
    let children: [CommentChild]
}

// MARK: - CommentChild
struct CommentChild: Decodable {
    let data: ChildData
}

// MARK: - ChildData
struct ChildData: Decodable {
    let body: String?
}

extension CommentElement {
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

extension CommentData {
    enum CodingKeys: String, CodingKey {
        case children = "children"
    }
}

extension CommentChild {
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

extension ChildData {
    enum CodingKeys: String, CodingKey {
        case body = "body"
    }
}


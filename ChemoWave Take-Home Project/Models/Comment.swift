//
//  Comment.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    var commentData: [CommentData]
}

struct CommentData: Decodable {
    var children: Children
}

struct Children: Decodable {
    var childrenData: [ChildrenData]
}

struct ChildrenData: Decodable {
    var childData: ChildData
}

struct ChildData: Decodable {
    var body: String
}

extension Comment {
    enum CodingKeys: String, CodingKey {
        case commentData = "data"
    }
}

extension Children {
    enum CodingKeys: String, CodingKey {
        case childrenData = "children"
    }
}

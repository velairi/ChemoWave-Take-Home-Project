//
//  Post.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//
import UIKit
import Foundation

struct PostTypeTop: Decodable {
    var data: PostData
}

struct PostData: Decodable {
    var children: [Child]
}

struct Child: Decodable {
    var data: Post
}

struct Post: Decodable {
    var title: String
    var thumbnail: String
    var permalink: String
}

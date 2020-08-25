//
//  ChemoWave_Take_Home_ProjectTests.swift
//  ChemoWave Take-Home ProjectTests
//
//  Created by Valerie Don on 8/24/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import XCTest

@testable import ChemoWave_Take_Home_Project

class ChemoWave_Take_Home_ProjectTests: XCTestCase {

    func testPostViewModel() {
        let post = Post(title: "My Reddit Top Post", thumbnail: "my image url", permalink: "/r/my post's comment endpoint/")
        let postViewModel = PostViewModel()
        postViewModel.titles.append(post.title)
        XCTAssertEqual(postViewModel.titles[0], post.title)


        postViewModel.thumbnailImages.append(UIImage(named: post.thumbnail))
        XCTAssertEqual(postViewModel.thumbnailImages[0], UIImage(named: post.thumbnail))

        postViewModel.permalinks.append(post.permalink)
        XCTAssertEqual(postViewModel.permalinks[0], post.permalink)
    }

    func testCommentViewModel() {
        let comment = ChildData(body: "This is a comment from a Reddit post")
        let commentViewModel = CommentViewModel()
        commentViewModel.comments.append(comment.body)
        XCTAssertEqual(commentViewModel.comments[0], comment.body)
    }
}

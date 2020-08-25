//
//  PostViewModel.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/24/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//
import UIKit
import Foundation

class PostViewModel {

    var titles = [String]()
    var thumbnailImages = [UIImage?]()
    var permalinks = [String]()

    func fetchPosts(completion: @escaping () -> Void) {
        PostService.fetchData() { [weak self] children in
            self?.titles = children.map { $0.data.title }
            self?.thumbnailImages = children.map {
                self?.getImage($0.data.thumbnail)
            }
            self?.permalinks = children.map { $0.data.permalink }
            completion()
        }
    }

    func getImage(_ imageURLString: String) -> UIImage {
        var image = UIImage()
        if let imageURL = URL(string: imageURLString) {
            do {
                let imageData = try Data(contentsOf: imageURL)
                image = UIImage(data: imageData)!
            } catch {
                print("IMAGE ERROR", error)
            }
        }
        return image
    }
}

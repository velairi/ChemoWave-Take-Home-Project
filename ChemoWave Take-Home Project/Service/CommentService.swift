//
//  CommentService.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/21/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import Foundation

class CommentService {

    class func fetchComments(_ permalink: String, completion: @escaping ([CommentChild]) -> Void) {
        guard let url = URL(string: updateURL(permalink)) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let object = try jsonDecoder.decode([CommentElement].self, from: data)
                for element in object {
                    let commentChild = element.data.children
                    completion(commentChild)
                }
            } catch {
                print("COMMENT ERROR", error)
            }
        }.resume()
    }

    //Removes the last slash and adds ".json" to the URL
    class func updateURL(_ permalink: String) -> String {
        var permalinkCopy = permalink
        permalinkCopy = String(permalinkCopy.dropLast())
        let url = "https://www.reddit.com" + permalinkCopy + ".json"
        return url
    }
}

//
//  CommentService.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/21/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import Foundation

class CommentService {

    class func fetchComments(_ permalink: String) {
        guard let url = URL(string: updateURL(permalink)) else { return }
        print("MY COMMENT URL IS:", url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let object = try jsonDecoder.decode([Comment].self, from: data)
                print(object)
            } catch {
                print("ERROR", error)
            }
        }.resume()
    }

    class func updateURL(_ permalink: String) -> String {
        var permalinkCopy = permalink
        permalinkCopy = String(permalinkCopy.dropLast())
        let url = "https://www.reddit.com" + permalinkCopy + ".json"
        return url
    }
}

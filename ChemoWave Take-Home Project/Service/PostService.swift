//
//  PostService.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import Foundation

class PostService {

    class func fetchData(completion: @escaping ([Child])-> Void) {
        guard let url = URL(string: "https://www.reddit.com/r/all/top.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let jsonObject = try jsonDecoder.decode(PostTypeTop.self, from: data)
                let children = jsonObject.data.children
                completion(children)
            } catch {
                print("POST ERROR", error)
            }
        }.resume()
    }
}

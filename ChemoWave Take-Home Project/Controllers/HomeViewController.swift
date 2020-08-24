//
//  HomeViewController.swift
//  ChemoWave Take-Home Project
//
//  Created by Valerie Don on 8/20/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var titles = [String]()
    var thumbnails = [String]()
    var permalinks = [String]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Reddit Top Posts"
        PostService.fetchData() { [weak self] children in
            self?.titles = children.map { $0.data.title }
            self?.thumbnails = children.map { $0.data.thumbnail }
            self?.permalinks = children.map { $0.data.permalink }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.separatorInset = .zero
        cell.textLabel?.font = UIFont(name: "Verdana", size: 20)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = titles[indexPath.row]
        cell.imageView?.image = getImage(thumbnails[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CommentsViewController(permalinks[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
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

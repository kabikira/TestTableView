//
//  ViewController.swift
//  TestTableView
//
//  Created by koala panda on 2023/04/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let cellClassName = "TableViewCell"
    private let reuseId = "TableViewCell"
    var petitions = [Petition]()

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            let cellNib = UINib(nibName: cellClassName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reuseId)

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://api.github.com/search/repositories?q=swift"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                print("!!!!!!!!!!view")
            }
        }
    }
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            print("parse")
            tableView.reloadData()
            print("reload")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let petition = petitions[indexPath.row]
        cell.configure(petition: petition)
        print("!!!!!!!!!!")
        return cell


    }


}


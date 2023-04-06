//
//  TableViewCell.swift
//  TestTableView
//
//  Created by koala panda on 2023/04/05.
//

import UIKit


class TableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var subTitle: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        subTitle.text = nil
    }
    func configure(petition: Petition) {
//        title.text = petition.id

    }

}

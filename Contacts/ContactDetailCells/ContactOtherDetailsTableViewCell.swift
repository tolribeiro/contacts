//
//  ContactOtherDetailsTableViewCell.swift
//  Contacts
//
//  Created by Thiago Ribeiro on 9/28/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

import UIKit

class ContactOtherDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var whereLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

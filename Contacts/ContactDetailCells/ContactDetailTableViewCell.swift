//
//  ContactDetailTableViewCell.swift
//  Contacts
//
//  Created by Thiago Ribeiro on 9/28/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

import UIKit

class ContactDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactProfileImage: UIImageView!
    @IBOutlet weak var contactCompany: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         self.createRoundedImage()
    }
    
    func createRoundedImage() {
        self.contactProfileImage.layer.cornerRadius = self.contactProfileImage.frame.size.width/2;
        self.contactProfileImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

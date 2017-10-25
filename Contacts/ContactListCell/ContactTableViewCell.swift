//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Thiago Ribeiro on 9/27/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

import UIKit
import SDWebImage

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactProfileImage: UIImageView!
    @IBOutlet weak var favoriteIcon: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactCompanyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.createRoundedImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Cell appearance methods
    
    func createRoundedImage() {
        self.contactProfileImage.layer.cornerRadius = self.contactProfileImage.frame.size.width/2;
        self.contactProfileImage.clipsToBounds = true
    }
    
    func initializeCellElements(contactObject: Contact) {
        
        self.contactProfileImage!.sd_setImage(with: URL(string: contactObject.smallImageURL!), placeholderImage: UIImage(named: "userSmall"))
        
        self.contactName.text = contactObject.name!
        
        contactObject.companyName = contactObject.companyName ?? " "
        
//        if contactObject.companyName != nil {
//            self.contactCompanyName.text = contactObject.companyName!
//        } else {
//            self.contactCompanyName.text = ""
//        }
        
        if contactObject.isFavorite == true {
            self.favoriteIcon.image = UIImage(named: "starTrue")
        } else {
            self.favoriteIcon.image = nil
        }
    }
}

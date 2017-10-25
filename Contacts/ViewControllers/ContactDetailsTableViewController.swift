//
//  ContactDetailsTableViewController.swift
//  Contacts
//
//  Created by Thiago Ribeiro on 9/28/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

import UIKit

class ContactDetailsTableViewController: UITableViewController {
    var contactObject = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false;
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else {
            return 120
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactMainInfo", for: indexPath) as? ContactDetailTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ContactDetailTableViewCell.")
            }
            cell.contactProfileImage!.sd_setImage(with: URL(string: contactObject.smallImageURL!), placeholderImage: UIImage(named: "userLarge"))
            cell.contactName.text = contactObject.name
            cell.contactCompany.text = contactObject.companyName
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactOtherInfo", for: indexPath) as? ContactOtherDetailsTableViewCell else {
                fatalError("The dequeued cell is not an instance of ContactOtherDetailsTableViewCell.")
            }
            
            if indexPath.section == 1 {
                var phoneNumber: String!
                switch indexPath.row {
                case 0:
                    phoneNumber = contactObject.phone.home
                    cell.whereLabel.text = "Home"
                case 1:
                    phoneNumber = contactObject.phone.work
                    cell.whereLabel.text = "Work"
                case 2:
                    phoneNumber = contactObject.phone.mobile
                    cell.whereLabel.text = "Mobile"
                default:
                    break
                }
                
                if phoneNumber == nil {
                    cell.titleLabel.text = ""
                    cell.whereLabel.text = ""
                } else {
                    cell.titleLabel.text = "PHONE:"
                }
                
                cell.descriptionLabel.text = phoneNumber
                
                return cell
            } else {
                cell.whereLabel.text = ""
                switch indexPath.row {
                case 0:
                    cell.titleLabel.text = "ADDRESS:"
                    cell.descriptionLabel.text = "\(String(describing: contactObject.address.street!))\(String(describing: contactObject.address.city!)),\(String(describing: contactObject.address.state!)) \(String(describing: contactObject.address.zipCode!)), \(String(describing: contactObject.address.country!))"
                case 1:
                    cell.titleLabel.text = "BIRTHDATE:"
                    cell.descriptionLabel.text = contactObject.birthdate
                case 2:
                    cell.titleLabel.text = "EMAIL:"
                    cell.descriptionLabel.text = contactObject.emailAddress
                default:
                    break
                }
                return cell
            }
        }
    }

}

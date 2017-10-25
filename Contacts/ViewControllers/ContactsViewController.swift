//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Thiago Ribeiro on 9/27/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

struct Constants {
    static let FETCH_CONTACTS_URL = "https://s3.amazonaws.com/technical-challenge/v3/contacts.json"
}

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var contactsArray = [Contact]()
    var favoriteContactsArray = [Contact]()
    var otherContactsArray = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getContacts()
        
        // setting tableview delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "ContactTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "ContactTableViewCell")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: Data Handling
    
    // fetching JSON from server
    func getContacts() {
        Alamofire.request(Constants.FETCH_CONTACTS_URL).responseJSON { response in
            guard response.result.isSuccess else {
            // error fetching json
                print("Error: \(String(describing: response.result.error))")
            return
            }
            // decode json
            do {
                self.contactsArray = try JSONDecoder().decode([Contact].self, from: response.data!)
                self.getContactsCategories()
            } catch let error {
                print(error)
            }
        }
    }
    
    // separates and populates contacts into favorites or others
    func getContactsCategories() {
        for contact in self.contactsArray {
            if contact.isFavorite! {
                self.favoriteContactsArray.append(contact)
            } else {
                self.otherContactsArray.append(contact)
            }
        }
        tableView.reloadData()
    }
    
    // MARK: TableView Datasource Methods
    
    // number of rows come from number of JSON objects
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //that data comes from number of contacts in JSON file
        if section == 0 {
            return self.favoriteContactsArray.count
        } else {
            return self.otherContactsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Favorite contacts"
        } else {
            return "Other contacts"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        
        var contact: Contact!
        
        contact = indexPath.section == 0 ? self.favoriteContactsArray[indexPath.row] : self.otherContactsArray[indexPath.row]
        
        cell.initializeCellElements(contactObject: contact)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    // one section contains the favorite contacts, the other section the others
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    // MARK: TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let contactDetails = storyboard.instantiateViewController(withIdentifier: "ContactDetails") as! ContactDetailsTableViewController
        
        var contactObject: Contact
        
        contactObject = indexPath.section == 0 ? favoriteContactsArray[indexPath.row] : otherContactsArray[indexPath.row]
        
        contactDetails.contactObject = contactObject
        
        navigationController?.pushViewController(contactDetails, animated: true)
    }
    
    

}


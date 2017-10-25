//
//  Contact.swift
//  Contacts
//
//  Created by Thiago Ribeiro on 9/27/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

import Foundation

struct Phone : Decodable {
    var work: String?
    var home: String?
    var mobile: String?
}

struct Address : Decodable {
    var street: String?
    var city: String?
    var state: String?
    var country: String?
    var zipCode: String?
}

class Contact : Decodable {
    var name: String?
    var id: String?
    var companyName: String?
    var isFavorite: Bool!
    var smallImageURL: String?
    var largeImageURL: String?
    var emailAddress: String?
    var birthdate: String?
    var phone = Phone()
    var address = Address()
}

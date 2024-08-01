//
//  User.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/22/24.
//

import Foundation
struct User: Codable {
  var firstName: String         = ""
  var lastName: String          = ""
  var email: String             = ""
  var birthday: Date            = Date()
  var needExtraNapkins: Bool    = false
  var needFrequentRefills: Bool = false
}

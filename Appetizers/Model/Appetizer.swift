//
//  Appetizer.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import Foundation

struct Appetizers: Decodable {
  let request: [Appetizer]
  
}

struct Appetizer: Decodable, Identifiable, Hashable {
  let id: Int
  let name: String
  let description: String
  let carbs: Int
  let calories: Int
  let price: Double
  let protein: Int
  let imageURL: String
}

struct MockData {
  static let sampleAppetizer = Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", carbs: 10, calories: 300, price: 5.88, protein: 40, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg")
  static let sampleListOfAppetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}

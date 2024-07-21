//
//  ErrorAlert.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import Foundation
import SwiftUI

struct ErrorAlert: Identifiable {
  let id: UUID
  let title: Text
  let message: Text
  let dismissButton: Alert.Button
}

struct ErrorAlertContext {
  static let invalidData = ErrorAlert(id: UUID(),
                                      title: Text("Invalid Data!"),
                                      message: Text("The data received from the server is invalid. Please contact support!"),
                                      dismissButton: .default(Text("Ok")))
  
  static let invalidURL = ErrorAlert(id: UUID(),
                                     title: Text("Invalid URL!"),
                                     message: Text("The URL used to fetch the data is invalid. Please contact support!"),
                                     dismissButton: .default(Text("Ok")))
  
  static let invalidResponse = ErrorAlert(id: UUID(),
                                          title: Text("Invalid Response!"),
                                          message: Text("The response received from the server is invalid. Please contact support!"),
                                          dismissButton: .default(Text("Ok")))
  
  static let unableToComplete = ErrorAlert(id: UUID(),
                                           title: Text("Unable to complete!"),
                                           message: Text("Unable to complete the request. Please check your internet connection!"),
                                           dismissButton: .default(Text("Ok")))
}

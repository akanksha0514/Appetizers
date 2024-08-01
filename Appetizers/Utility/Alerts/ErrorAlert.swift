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

struct ValidationErrorAlert {
  static let emptyFields = ErrorAlert(id: UUID(),
                                      title: Text("Incomplete Form"),
                                      message: Text("Please make sure to enter First name, Last name and email address to save changes"),
                                      dismissButton: .default(Text("Ok")))
  
  static let invalidEmail = ErrorAlert(id: UUID(),
                                     title: Text("Invalid Email"),
                                     message: Text("The email entered is invalid. Please check again!"),
                                     dismissButton: .default(Text("Ok")))
}

struct SaveUserAlert {
  static let success = ErrorAlert(id: UUID(),
                                      title: Text("Success!"),
                                      message: Text("Changes made to form has been saved successfully!"),
                                      dismissButton: .default(Text("Ok")))
  
  static let failure = ErrorAlert(id: UUID(),
                                     title: Text("Failed!"),
                                     message: Text("Unable to save changes to form. Try again later!"),
                                     dismissButton: .default(Text("Ok")))
}

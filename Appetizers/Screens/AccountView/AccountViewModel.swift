//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/22/24.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
  @AppStorage("user") private var userData: Data?
  @Published var user = User()
  @Published var alertItem: ErrorAlert?
  
  var validateForm: Bool {
    guard !user.firstName.isEmpty, !user.lastName.isEmpty, !user.email.isEmpty else {
      alertItem = ValidationErrorAlert.emptyFields
      return false
    }
    guard user.email.isValidEmail else {
      alertItem = ValidationErrorAlert.invalidEmail
      return false
    }
    return true
  }
  
  func saveForm() {
    guard validateForm else { return }
    do {
      let data = try JSONEncoder().encode(user)
      userData = data
      alertItem = SaveUserAlert.success
    } catch {
      alertItem = SaveUserAlert.failure
    }
  }
  
  func retrieveForm() {
    guard let userData = userData else { return }
    do {
      let decodedUser = try JSONDecoder().decode(User.self, from: userData)
      user = decodedUser
    } catch {
      alertItem = ErrorAlertContext.invalidData
    }
  }
}

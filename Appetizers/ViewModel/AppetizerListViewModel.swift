//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject {
  
  @Published var appetizers: [Appetizer] = [] // remember observable object needs to broadcast when it changes
  @Published var alertItem: ErrorAlert?
  @Published var inProgress: Bool = false
  
  func getAppetizers() {
    inProgress = true
    NetworkManager.shared.getAppetizers {[self] result in
      DispatchQueue.main.async {
        self.inProgress = false
        switch result {
        case .success(let appetizers):
          self.appetizers = appetizers
        case .failure(let error):
          self.setupErrorMessage(error)
        }
      }
    }
  }

  func setupErrorMessage(_ error: APError) {
    switch error {
    case .invalidData:
      alertItem = ErrorAlertContext.invalidData
    case .invalidResponse:
      alertItem = ErrorAlertContext.invalidResponse
    case .invalidURL:
      alertItem = ErrorAlertContext.invalidURL
    case .unableToComplete:
      alertItem = ErrorAlertContext.unableToComplete
    }
  }
}

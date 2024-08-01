//
//  AccountView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct AccountView: View {
  
  @StateObject var viewModel: AccountViewModel
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Firstname", text: $viewModel.user.firstName)
          TextField("Lastname", text: $viewModel.user.lastName)
          TextField("Email", text: $viewModel.user.email)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.none)
            .autocorrectionDisabled()
          DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
          Button {
            viewModel.saveForm()
          } label: {
            Text("Save Changes")
          }
        } header: {
          Text("Personal")
        }
        
        // Section 2
        Section {
          Toggle("Extra Napkins", isOn: $viewModel.user.needExtraNapkins)
          Toggle("Frequent Refills", isOn: $viewModel.user.needFrequentRefills)
        }
        header: {
          Text("Requests")
        }
        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
      }
      .navigationTitle("Account")
      .onAppear {
        viewModel.retrieveForm()
      }
      .alert(item: $viewModel.alertItem) { alertItem in
        Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
      }
    }
  }
}

#Preview {
  AccountView(viewModel: AccountViewModel())
}

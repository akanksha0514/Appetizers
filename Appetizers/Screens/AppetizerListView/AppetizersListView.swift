//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct AppetizersListView: View {
  
  @StateObject var viewModel: AppetizerListViewModel // if you're initialising a viewmodel you need a state object, if you're passing the viewmodel in from another previous view because you needed data from that view use observed object
  
  var body: some View {
    ZStack {
      NavigationView {
        List(viewModel.appetizers) { appetizer in
          AppetizerCellView(appetizer: appetizer)
            .onTapGesture {
              viewModel.selectedAppetizer = appetizer
              viewModel.isShowingDetail = true
            }
        }
        .listStyle(.plain)
        .navigationTitle("Appetizers")
        .disabled(viewModel.isShowingDetail)
      }.onAppear {
        viewModel.getAppetizers()
      }
      .blur(radius: viewModel.isShowingDetail ? 20 : 0)
      
      if viewModel.isShowingDetail {
        AppetizersDetailCardView(appetizer: viewModel.selectedAppetizer!,
                                 isShowDetailView: $viewModel.isShowingDetail)
      }
      
      if viewModel.inProgress {
        ProgressView()
          .tint(.brandPrimary)
      }
    }
    .alert(item: $viewModel.alertItem) { alert in
      Alert(title: alert.title,
            message: alert.message,
            dismissButton: alert.dismissButton)
    }
  }
}

#Preview {
  AppetizersListView(viewModel: AppetizerListViewModel())
}

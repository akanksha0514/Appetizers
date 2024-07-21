//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct AppetizersListView: View {
  
  @StateObject var viewModel: AppetizerListViewModel // if you're initialising a viewmodel you need a state object, if you're passing the viewmodel in from another previous view because you needed data from that view use observed object
  @State var isShowingDetail: Bool = false
  @State private var selectedAppetizer: Appetizer?
  
  var body: some View {
    ZStack {
      NavigationView {
        List(viewModel.appetizers) { appetizer in
          AppetizerCellView(appetizer: appetizer)
            .onTapGesture {
              selectedAppetizer = appetizer
              isShowingDetail = true
            }
        }
        .listStyle(.plain)
        .navigationTitle("Appetizers")
        .disabled(isShowingDetail)
      }.onAppear {
        viewModel.getAppetizers()
      }
      .blur(radius: isShowingDetail ? 20 : 0)
      
      if isShowingDetail {
        AppetizersDetailCardView(appetizer: selectedAppetizer!,
                                 isShowDetailView: $isShowingDetail)
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

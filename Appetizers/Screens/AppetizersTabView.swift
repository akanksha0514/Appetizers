//
//  ContentView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI
import CoreData

struct AppetizersTabView: View {

    var body: some View {
      TabView {
        AppetizersListView(viewModel: AppetizerListViewModel())
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        AccountView(viewModel: AccountViewModel())
          .tabItem {
            Image(systemName: "person")
            Text("Account")
          }
        OrderView()
          .tabItem {
            Image(systemName: "bag")
            Text("Order")
          }
      }
      .tint(.brandPrimary)
    }

}

#Preview {
    AppetizersTabView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

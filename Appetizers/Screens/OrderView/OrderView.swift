//
//  OrderView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct OrderView: View {
  @State private var orderItems = MockData.ordersList
  
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          List {
            ForEach(orderItems) { appetizer in
              AppetizerCellView(appetizer: appetizer)
            }
            .onDelete { indexSet in
              deleteItems(at: indexSet)
            }
          }
          .listStyle(.plain)
          
          APButton(buttonText: "Place Order")
            .padding()
        }
        if orderItems.isEmpty {
          EmptyStateView(imageName: "empty-order", message: "You have no items in your order. \nPlease add an appetizer!")
        }
        
      }
      .navigationTitle("Orders")
      
    }
  }
  
  func deleteItems(at offset: IndexSet) {
    orderItems.remove(atOffsets: offset)
  }
}

#Preview {
  OrderView()
}

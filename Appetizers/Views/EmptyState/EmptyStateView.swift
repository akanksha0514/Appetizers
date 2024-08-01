//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/22/24.
//

import SwiftUI

struct EmptyStateView: View {
  
  let imageName: String
  let message: String
  
    var body: some View {
      ZStack {
        Color(.systemBackground)
          .ignoresSafeArea(edges: .all)
        VStack(spacing: 10) {
          Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 150)
          Text(message)
            .font(.title3)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)
            .padding()
        }
        .offset(y: -50)
      }
    }
}

#Preview {
  EmptyStateView(imageName: "empty-order", message: "Default message")
}

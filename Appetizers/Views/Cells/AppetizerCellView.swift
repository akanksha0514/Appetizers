//
//  AppetizerCellView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct AppetizerCellView: View {
  let appetizer: Appetizer
    var body: some View {
      HStack {
        
        AppetizerRemoteImage(urlString: appetizer.imageURL)
          .aspectRatio(contentMode: .fit)
          .frame(width: 120, height: 90)
          .cornerRadius(8.0)

        VStack(alignment: .leading, spacing: 5) {
          Text(appetizer.name)
            .font(.title2)
            .fontWeight(.medium)
            .lineLimit(3)
          Text("$ \(appetizer.price, specifier: "%.2f")")
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
        }
        .padding(.leading)
      }
    }
}

#Preview {
  AppetizerCellView(appetizer: MockData.sampleAppetizer)
}

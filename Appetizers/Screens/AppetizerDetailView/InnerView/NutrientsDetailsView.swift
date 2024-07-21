//
//  NutrientsDetailsView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct NutrientsDetailsView: View {
  var title: String
  var titleValue: String
    var body: some View {
      VStack(spacing: 5)  {
        Text(title)
          .bold()
          .font(.caption)
        Text(titleValue)
          .foregroundStyle(.secondary)
          .fontWeight(.semibold)
          .italic()
      }

    }
}

#Preview {
  NutrientsDetailsView(title: "", titleValue: "")
}

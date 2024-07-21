//
//  APButton.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct APButton: View {
  var buttonText: LocalizedStringKey
  
    var body: some View {
      Text(buttonText)
        .font(.callout)
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity, maxHeight: 50)
        .foregroundStyle(.white)
        .background(.brandPrimary)
        .cornerRadius(8)
    }
}

#Preview {
  APButton(buttonText: "")
}

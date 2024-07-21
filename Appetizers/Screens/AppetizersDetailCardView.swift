//
//  AppetizersDetailCardView.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

struct AppetizersDetailCardView: View {
  let appetizer: Appetizer
  @Binding var isShowDetailView: Bool
  var body: some View {
    VStack(alignment: .center) {
      AppetizerRemoteImage(urlString: appetizer.imageURL)
        .aspectRatio(contentMode: .fit)
        .frame(width: 300, height: 225)
      
      VStack(spacing: 10) {
        Text(appetizer.name)
          .font(.title2)
          .fontWeight(.bold)
        
        Text(appetizer.description)
          .multilineTextAlignment(.center)
          .font(.caption)
          .padding()
        
        HStack(spacing: 40) {
          NutrientsDetailsView(title: "Calories", titleValue: "\(String(appetizer.calories))gm")
          NutrientsDetailsView(title: "Carbs", titleValue: "\(String(appetizer.carbs))gm")
          NutrientsDetailsView(title: "Protein", titleValue: "\(String(appetizer.protein))gm")
        }
      }
      
      Spacer()
      
      Button {
        // add action
      } label: {
        APButton(buttonText: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
      }
      .padding()
      
    }
    .frame(width: 300, height: 550, alignment: .center)
    .background(Color(.systemBackground))
    .cornerRadius(12)
    .shadow(radius: 40)
    .overlay(alignment: .topTrailing) {
      Button {
        isShowDetailView = false
      } label: {
        APCloseButton()
      }
    }
  }
}

#Preview {
  AppetizersDetailCardView(appetizer: MockData.sampleAppetizer, isShowDetailView: .constant(false))
}

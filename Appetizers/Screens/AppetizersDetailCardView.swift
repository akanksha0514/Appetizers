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
          VStack(spacing: 5) {
            Text("Calories")
              .bold()
              .font(.caption)
            Text("\(String(appetizer.calories))gm")
              .foregroundStyle(.secondary)
              .fontWeight(.semibold)
              .italic()
          }
          VStack(spacing: 5)  {
            Text("Carbs")
              .bold()
              .font(.caption)
            Text("\(String(appetizer.carbs))gm")
              .foregroundStyle(.secondary)
              .fontWeight(.semibold)
              .italic()
          }
          VStack(spacing: 5)  {
            Text("Protein")
              .bold()
              .font(.caption)
            Text("\(String(appetizer.protein))gm")
              .foregroundStyle(.secondary)
              .fontWeight(.semibold)
              .italic()
          }
        }
      }
      
      Spacer()
      
      Button {
        // add action
      } label: {
        Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
          .font(.callout)
          .fontWeight(.semibold)
      }
      .frame(maxWidth: .infinity, maxHeight: 50)
      .foregroundStyle(.white)
      .background(.brandPrimary)
      .cornerRadius(8)
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
        ZStack{
          Circle()
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
            .opacity(0.6)
          Image(systemName: "xmark")
            .imageScale(.small)
            .frame(width: 44, height: 44)
            .foregroundColor(.black)
        }
      }
    }
  }
}

#Preview {
  AppetizersDetailCardView(appetizer: MockData.sampleAppetizer, isShowDetailView: .constant(false))
}

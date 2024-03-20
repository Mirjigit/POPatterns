//
//  PatternDetailView.swift
//  POPatterns
//
//  Created by Burkan on 20/3/24.
//

import SwiftUI

struct PatternDetailView: View {
    var pattern: Pattern
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isFavorite: Bool // Проверка на избранность
    
    init(pattern: Pattern) {
        self.pattern = pattern
        _isFavorite = State(initialValue: pattern.isFavorite)
    }
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                Text(pattern.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ScrollView {
                    VStack() {
                        Image(pattern.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .cornerRadius(20)
                            .padding()
                        
                        Text(pattern.descriptions)
                            .padding([.bottom, .horizontal])
                    }
                }
                
                Spacer()
                
                
                Button(action: {
                    let currentlyFavorite = favoritesViewModel.isFavorite(pattern: pattern)
                    isFavorite.toggle()

                    if isFavorite && !currentlyFavorite {
                        favoritesViewModel.addFavorite(pattern: pattern)
                    } else if !isFavorite && currentlyFavorite {
                        favoritesViewModel.removeFavorite(pattern: pattern)
                    }
                }) {
                    Text(isFavorite ? "Remove from Favorites" : "Add to Favorites")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.lightblue)
                        .cornerRadius(10)
                }

                
                
                .padding(.horizontal)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back to List")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.lightblue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            isFavorite = favoritesViewModel.isFavorite(pattern: pattern)
        }
        
    }
}


//#Preview {
//    PatternDetailView(pattern: Pattern(id: 1, name: "Double bottom",
//                                       descriptions: """
//A double bottom chart pattern indicates a period of selling, causing an asset’s price to drop below a level of support. It will then rise to a level of resistance, before dropping again. Finally, the trend will reverse and begin an upward motion as the market becomes more bullish.
//
//
//
//""",
//                                       imageName: "cup-and-handle"))
//}

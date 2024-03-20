//
//  ContentView.swift
//  POPatterns
//
//  Created by Burkan on 20/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter = ViewRouter()
    @State private var resetNavigationID = UUID()
    @State private var showingFavorites = false
    @StateObject var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradient()
                VStack {
                    List {
                        if showingFavorites == false {
                            NavigationLink(destination: PNLAssistantView(viewRouter: viewRouter), isActive: .constant(false)) {
                                Text("PNL ASSISTANT")
                                    .frame(height: 10)
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .padding(.vertical)
                                    .cornerRadius(15)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .listRowSeparator(.hidden)
                            
                            .listRowBackground(Color.clear)
                            
                            // Список паттернов
                            ForEach(patterns) { pattern in
                                NavigationLink(destination: PatternDetailView(pattern: pattern)) {
                                    Text(pattern.name)
                                        .foregroundColor(.lightblue)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .frame(height: 60)
                                        .padding(.vertical)
                                    
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .listRowBackground(Color.clear)
                            }
                        }
                        
                        else{   //Избранные
                            ForEach(favoritesViewModel.favorites) { pattern in
                                NavigationLink(destination: PatternDetailView(pattern: pattern)) {
                                    Text(pattern.name)
                                        .foregroundColor(.lightblue)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .frame(height: 60)
                                        .padding(.vertical)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .listRowBackground(Color.clear)
                            }
                            .listRowSeparator(.hidden)
                        }
                        
                    }
                    .navigationBarTitleDisplayMode(.inline)
                }
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Button(action: {
                                showingFavorites = false
                            }) {
                                Text("PATTERNS")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .foregroundColor(showingFavorites ? .gray : .black)
                            }
                            
                            Button(action: {
                                showingFavorites = true
                            }) {
                                Text("FAVORITES")
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .foregroundColor(showingFavorites ? .black : .gray)
                            }
                        }
                    }
                }
            }
            
        }
        
        .id(resetNavigationID) // Сброс стека навигации
        .environmentObject(favoritesViewModel)
        .onChange(of: viewRouter.shouldReturnToRoot) { shouldReturn in
            if shouldReturn {
                // Генерация нового UUID для сброса NavigationStack
                self.resetNavigationID = UUID()
                viewRouter.shouldReturnToRoot = false
            }
        }
        .environmentObject(favoritesViewModel)
    }
}

class ViewRouter: ObservableObject {
    @Published var shouldReturnToRoot = false
    
    func returnToRoot() {
        shouldReturnToRoot = true
    }
}

#Preview {
    ContentView()
}

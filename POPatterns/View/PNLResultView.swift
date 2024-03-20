//
//  PNLResultView.swift
//  POPatterns
//
//  Created by Burkan on 20/3/24.
//

import SwiftUI

struct PNLResultView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var profit: Double
    var profitPercentage: Double
    @Environment(\.presentationMode) var presentationMode // Nавигация назад
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                
                VStack() {
                    Text("PNL ASSISTANT")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        viewRouter.shouldReturnToRoot = true
                    }) {
                        HStack {
                            Spacer()
                            Text("← BACK TO PATTERNS")
                                .padding()
                            
                                .contentShape(Rectangle())
                            Spacer()
                        }
                    }
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack() {
                        Text("PROFIT: \(profit, specifier: "%.2f")")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.top)
                            .padding(.horizontal)
                        Text("or")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(10)
                        Text("\(profitPercentage, specifier: "%.0f")%")
                            .font(.title)
                            .foregroundColor(.lightblue)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Spacer()
                            Text("RECALCULATE")
                                .padding()
                                .contentShape(Rectangle())
                            Spacer()
                        }
                    }
                    .background(Color.white)
                    .foregroundColor(.lightblue)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PNLResultView(viewRouter: ViewRouter(), profit: 2000.0, profitPercentage: 32)
}

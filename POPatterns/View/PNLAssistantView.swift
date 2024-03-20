//
//  PNLAssistantView.swift
//  POPatterns
//
//  Created by Burkan on 20/3/24.
//

import SwiftUI

struct PNLAssistantView: View {
    @State private var entryPrice: String = ""
    @State private var exitPrice: String = ""
    @State private var sharesAmount: String = ""
    @State private var feesPercentage: String = ""
    @State private var profit: Double?
    @State private var profitPercentage: Double?
    @State private var calculatedProfit: Double = 0
    @State private var calculatedProfitPercentage: Double = 0
    
    @State private var showResult: Bool = false // Для перехода к результатам
    @State private var showResults = false
    
    @ObservedObject var viewRouter: ViewRouter
    
    @Environment(\.presentationMode) var presentationMode // Для навигации назад
    
    enum FocusedField {
        case entryPrice, exitPrice, sharesAmount, feesPercentage
    }
    
    @FocusState private var focusedField: FocusedField?
    
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradient()
                VStack {
                    
                    ScrollView {
                        
                        VStack(spacing: 15) {
                            Text("PNL ASSISTANT")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
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
                            
                            PNLtext()
                            
                            TextField("Entry price", text: $entryPrice)
                                .focused($focusedField, equals: .entryPrice)
                                .onSubmit {
                                    focusedField = .exitPrice
                                }
                                .textContentType(.oneTimeCode)
                            
                                .keyboardType(.numberPad)
                            
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            TextField("Exit price", text: $exitPrice)
                                .focused($focusedField, equals: .exitPrice)
                                .onSubmit {
                                    focusedField = .sharesAmount
                                }
                                .keyboardType(.numberPad)
                            
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            TextField("Shares amount", text: $sharesAmount)
                                .focused($focusedField, equals: .sharesAmount)
                                .onSubmit {
                                    focusedField = .feesPercentage
                                }
                                .keyboardType(.numberPad)
                            
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            TextField("Percentage of fees on profit, if any", text: $feesPercentage)
                                .focused($focusedField, equals: .feesPercentage)
                                .submitLabel(.done)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    NavigationLink(destination: PNLResultView(viewRouter: viewRouter, profit: calculatedProfit, profitPercentage: calculatedProfitPercentage), isActive: $showResults) { EmptyView() }
                    
                    Button(action: {
                        calculatePNL()
                        showResults = true
                        
                    }) {
                        HStack {
                            Spacer()
                            Text("CALCULATE PNL")
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
                    .padding(.bottom, 20)
                    
                    if let profit = profit, let profitPercentage = profitPercentage {
                        Text("PROFIT: \(profit, specifier: "%.2f")")
                        Text("PROFIT PERCENTAGE: \(profitPercentage, specifier: "%.2f")%")
                            .padding()
                    }
                }
            }
        }
        .onAppear {
            focusedField = .entryPrice
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func calculatePNL() {
        guard let entryPrice = Double(entryPrice),
              let exitPrice = Double(exitPrice),
              let sharesAmount = Double(sharesAmount),
              let fees = Double(feesPercentage.isEmpty ? "0" : feesPercentage) else {
            return
        }
        
        let initialTotal = entryPrice * sharesAmount
        let finalTotal = exitPrice * sharesAmount
        var profit = finalTotal - initialTotal
        
        if fees > 0, profit > 0 {
            profit -= profit * (fees / 100)
        }
        
        let profitPercentage = (profit / initialTotal) * 100
        
        self.calculatedProfit = profit
        self.calculatedProfitPercentage = profitPercentage
        self.showResult = true // Готовимся показать результаты
    }
}


#Preview {
    PNLAssistantView(viewRouter: ViewRouter())
}


struct PNLtext: View {
    var body: some View {
        Text("PNL (Profit and Loss) is a crucial term in the context of trading and investing. It represents the net financial outcome of a trading position or investment over a certain period. You can calculate it by deducting the whole cost of purchasing an asset or investment from the total revenue you get when selling it.")
            .padding()
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
            .frame(height: 220)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.bottom, 15)
    }
}

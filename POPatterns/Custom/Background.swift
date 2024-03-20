//
//  Background.swift
//  POPatterns
//
//  Created by Burkan on 20/3/24.
//

import Foundation
import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(red: 0 / 255, green: 102 / 255, blue: 255 / 255, opacity: 0), location: 0),
                .init(color: Color(red: 0 / 255, green: 194 / 255, blue: 255 / 255, opacity: 1), location: 1)
            ]),
            startPoint: .top,
            endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
}

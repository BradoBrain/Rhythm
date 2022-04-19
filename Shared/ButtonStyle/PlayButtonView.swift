//
//  PlayButtonView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 13.04.2022.
//

import SwiftUI

struct PlayButtonStyle: ButtonStyle {
    @State var symbolName: String

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(50)
            .background(
                Image(systemName: symbolName)
                    .padding()
                    .frame(width: 70, height: 70)
                    .background(.gray.opacity(0.8))
                    .cornerRadius(16)
                    .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 0.5), value: configuration.isPressed)
        )
    }
}

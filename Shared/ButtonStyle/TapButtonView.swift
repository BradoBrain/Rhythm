//
//  CustomButtonView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 13.04.2022.
//

import SwiftUI

struct TapButtonStyle: ButtonStyle {
    @State var buttonName: String

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(50)
            .background(
                Text(buttonName)
                    .padding()
                    .frame(width: 70, height: 70)
                    .background(.gray.opacity(0.8))
                    .cornerRadius(16)
                    .foregroundColor(.white)
                    .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 0.3), value: configuration.isPressed)
        )
    }
}

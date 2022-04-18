//
//  PlayButtonView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 13.04.2022.
//

import SwiftUI

struct PlayButtonView: View {
    @State var symbolName: String

    var body: some View {
        Image(systemName: symbolName)
            .padding()
            .frame(width: 70, height: 70)
            .background(.gray.opacity(0.8))
            .cornerRadius(16)
    }
}

struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView(symbolName: "playpause")
            .previewLayout(.sizeThatFits)
    }
}

//
//  CustomButtonView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 13.04.2022.
//

import SwiftUI

struct TapButtonView: View {
    @State var buttonName: String
    
    var body: some View {
        Text(buttonName)
            .padding()
            .frame(width: 70, height: 70)
            .background(.gray.opacity(0.8))
            .cornerRadius(16)
            .foregroundColor(.white)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TapButtonView(buttonName: "Tap")
    }
}

//
//  SwiftUIView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 22.04.2022.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack {
            Color("Background")
            
            Image("StartLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
        }.ignoresSafeArea(.all)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}

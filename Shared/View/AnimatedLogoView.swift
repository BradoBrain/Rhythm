//
//  AnimatedLogoView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 21.04.2022.
//

import SwiftUI

struct AnimatedLogoView: View {
    @State private var start = false
    @State private var logo1 = true
    @State private var logo2 = true
    @State private var logo3 = true
    @State private var logo4 = true
    @State private var logo5 = true
    @State private var logo6 = true
    @State private var logo7 = true
    @State private var logo8 = true
    @State private var logo9 = true
    @State private var logo10 = true
    
    var body: some View {
        VStack{
            ZStack {
                // 10 layer
                ZStack {
                    Color("Background")
                    
                    Spacer()
                    
                    Image("logo8")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .scaleEffect(1.2)
                }
                .ignoresSafeArea(.all)
                .animation(.easeIn, value: logo10)
                .opacity(logo10 ? 1 : 0)
                
                // 9 layer
                ZStack {
                    Color("Background")
                    
                    Spacer()
                    
                    Image("logo8")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .scaleEffect(1.2)
                }
                .ignoresSafeArea(.all)
                .animation(.easeIn, value: logo9)
                .opacity(logo9 ? 1 : 0)
                
                
                    // 8 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo8")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(1.2)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo8)
                    .opacity(logo8 ? 1 : 0)
                    
                    // 7 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(1.2)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo7)
                    .opacity(logo7 ? 1 : 0)
                    
                    // 6 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo6")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(1.2)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo6)
                    .opacity(logo6 ? 1 : 0)
                    
                    // 5 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(1.2)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo5)
                    .opacity(logo5 ? 1 : 0)
                    
                    // 4 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(1.2)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo4)
                    .opacity(logo4 ? 1 : 0)
                    
                    // 3 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(1.2)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo3)
                    .opacity(logo3 ? 1 : 0)
                    
                    // 2 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(1.2)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo2)
                    .opacity(logo2 ? 1 : 0)
                    
                    // 1 layer
                    ZStack {
                        Color("Background")
                        
                        Spacer()
                        
                        Image("logo1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .scaleEffect(start ? 1.2 : 1)
                            .animation(.linear(duration: 2), value: start)
                    }
                    .ignoresSafeArea(.all)
                    .animation(.easeIn, value: logo1)
                    .opacity(logo1 ? 1 : 0)
            }
        }
        .onAppear {
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    start.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    logo1.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                    logo2.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                    logo3.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                    logo4.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                    logo5.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    logo6.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    logo7.toggle()
                }
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.4) {
                    logo8.toggle()
                }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                    logo9.toggle()
                }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
                    logo10.toggle()
                }
        } .animation(.easeInOut, value: start)
        
    }
}

struct AnimatedLogoView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLogoView()
    }
}

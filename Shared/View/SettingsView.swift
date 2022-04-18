//
//  SettingsView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 14.04.2022.
//

import SwiftUI

struct SettingsView: View {
    @State var clickToggle      = true
    @State var cawbellToggle    = false
    @State var kickToggle       = false
    @State var hiHatToggle      = false
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Click")
                    
                    Toggle(isOn: $clickToggle
                           , label: { Text("") })
                }
                .padding()
                .background(.gray.opacity(0.8))
                .clipShape(Capsule())
                .padding(.horizontal, 7)
                .foregroundColor(.white)
                
                HStack {
                    Text("Cawbell")
                    
                    Toggle(isOn: $cawbellToggle, label: { Text("") })
                }
                .padding()
                .background(.gray.opacity(0.8))
                .clipShape(Capsule())
                .padding(.horizontal, 7)
                .foregroundColor(.white)
                
                HStack {
                    Text("Kick")
                    
                    Toggle(isOn: $kickToggle, label: { Text("") })
                }
                .padding()
                .background(.gray.opacity(0.8))
                .clipShape(Capsule())
                .padding(.horizontal, 7)
                .foregroundColor(.white)
                
                HStack {
                    Text("Hi Hat")
                    
                    Toggle(isOn: $hiHatToggle, label: { Text("") })
                }
                .padding()
                .background(.gray.opacity(0.8))
                .clipShape(Capsule())
                .padding(.horizontal, 7)
                .foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

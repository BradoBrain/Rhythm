//
//  ContentView.swift
//  Shared
//
//  Created by Artem Vinogradov on 10.04.2022.
//

import SwiftUI
import AVFoundation
import Foundation


struct ContentView: View {
    // ???
    enum Tempo: String, CaseIterable, Identifiable {
        case tempo0 = "Customize"
        case tempo1 = "60"
        case tempo2 = "80"
        case tempo3 = "96"
        case tempo4 = "108"
        case tempo5 = "120"
        case tempo6 = "144"
        
        var id: String { self.rawValue }
    }
    
    @StateObject private var tempoManager: TempoControl = TempoControl()
    
    let audioManager: AudioControl = {
        let lowUrl = Bundle.main.url(forResource: "click", withExtension: "mp3")
        return AudioControl(clikFile: lowUrl!)
    }()
    
    @State private var isOn: Bool = false
    @State private var pickerTempo: String = Tempo.tempo0.rawValue
//    @State private var sliderTempo: UInt32 = 0
    @State var beatValue: CGFloat = 100
    
    @State private var audioPlayer: AVAudioPlayer!
    
    
     @State private var isEditing: Bool = false
    
    
    
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack {
                Text("Practice to fight").bold().font(.largeTitle).foregroundColor(.white)
                
                Spacer()
                
                Spacer()
                
                Text("\(tempoManager.whichTempoMarking(tempo: beatValue))")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        isOn.toggle()
                        if isOn {
                            audioManager.play(bpm: beatValue)
                        }
                        else {
                            audioManager.stop()
                        }
                    }, label: {
                        PlayButtonView(symbolName: "playpause").foregroundColor(isOn ? .green : .white)
                    }) .offset(y: 50)
                    
                    CustomSliderView(beatValue: $beatValue)
                        .padding(.bottom, 50)
                        .offset(y: -60)
                    
                    TapButtonView(buttonName: "Tap")
                        .offset(y: 50)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}





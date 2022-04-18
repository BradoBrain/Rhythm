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
    @StateObject private var tempoManager: TempoControl = TempoControl()
    
    @State var beatValue: CGFloat = 100
    
    @State private var isOn: Bool = false
    @State private var toSettings = false
    
    // For tap function
    @State private var timeOutInterval = 5.0
    @State private var minTaps = 3
    @State private var taps: [NSDate] = []
    @State private var calculatedbpm = 0
    @State private var timeOut = 5
    @State private var minimumTaps = 3
    
    let audioManager: AudioControl = {
        let lowUrl = Bundle.main.url(forResource: "click", withExtension: "mp3")!
        return AudioControl(clikFile: lowUrl)
    }()
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack {
                // Title
                HStack {
                    Text("Practice").bold().font(.largeTitle).foregroundColor(Color("Blue"))
                    Text("To Fight").bold().font(.largeTitle).foregroundColor(Color("Yellow"))
                }
                
                Spacer()
                Spacer()
                
                // Name of tempo from TempoControl
                Text("\(tempoManager.whichTempoMarking(tempo: beatValue))")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding()
                
                // Slider to change bpm from CustomSliderView
                ZStack {
                    CustomSliderView(beatValue: $beatValue)
                        .padding(25)
                    
                    HStack {
                        Button(action: {
                            beatValue -= CGFloat(1)
                        }, label: {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                                .font(.title2)
                                .frame(width: 50, height: 50)
                        }) .padding(.horizontal, 40)
                        
                        Button(action: {
                            beatValue += CGFloat(1)
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.title2)
                                .frame(width: 50, height: 50)
                        }) .padding(.horizontal, 40)
                    }
                }
                
                // Play, Tap and Settings Buttons
                HStack {
                    // Play/Pause button
                    Button(action: {
                        isOn.toggle()
                        isOn ? audioManager.play(bpm: beatValue) : audioManager.stop()
                    }, label: {
                        PlayButtonView(symbolName: "playpause")
                            .foregroundColor(isOn ? Color("Blue") : .white)
                    })
                    
                    Spacer()
                    
                    // Tap button
                    Button(action: {
                        tapValueFunc()
                    }, label: {
                        TapButtonView(buttonName: "Tap")
                    })
                    
                    Spacer()
                    
                    // Settings button
                    Button(action: {
                        self.toSettings.toggle()
                    }, label: {
                        Image(systemName: "gear")
                            .padding()
                            .font(.title)
                            .frame(width: 70, height: 70)
                            .background(.gray.opacity(0.8))
                            .cornerRadius(16)
                            .foregroundColor(.white)
                    }) .sheet(isPresented: $toSettings) {
                        NavigationView { SettingsView() }
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 40)
            }
        }
    }
    
    // Tap function
    func tapValueFunc() {
        self.beatValue = CGFloat(addTap() ?? 100) // conditional unwrap of returned value
    }
    // Subfunction for tapValueFunc
    func addTap() -> Int? {
        let thisTap = NSDate()
        if let lastTap = taps.last {
            if thisTap.timeIntervalSince(lastTap as Date) > timeOutInterval {
                self.taps.removeAll()
            }
        }
        taps.append(thisTap)
        guard taps.count >= minTaps else { return nil }
        guard let firstTap = taps.first else { return 0 }
        let avgIntervals = thisTap.timeIntervalSince(firstTap as Date) / Double(taps.count - 1)
        calculatedbpm = Int((60.0 / avgIntervals))
        print(calculatedbpm)
        return calculatedbpm
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(beatValue: 100)
            .preferredColorScheme(.dark)
    }
}





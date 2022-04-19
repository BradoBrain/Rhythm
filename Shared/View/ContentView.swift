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

    
    // For tap function
    @State private var timeOutInterval = 5.0
    @State private var minTaps = 3
    @State private var taps: [NSDate] = []
    @State private var calculatedbpm = 0
    @State private var timeOut = 3
    
    let audioManager: AudioControl = {
        let lowUrl = Bundle.main.url(forResource: "Click", withExtension: "mp3")!
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
                } .padding(.top, 25)
                
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
                        #if os(macOS)
                        Button(action: {
                            beatValue -= CGFloat(1)
                        }, label: {
                            Image(systemName: "minus")
                                .padding()
                                .clipShape(Circle())
                                .background(Color("Background")
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(15))
                                .foregroundColor(.white)
                                .font(.title2)
                                
                        }) .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 40)
                        #else
                        Button(action: {
                            beatValue -= CGFloat(1)
                        }, label: {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                                .font(.title2)
                                .frame(width: 50, height: 50)
                        }) .padding(.horizontal, 40)
                        #endif
                        
                        #if os(macOS)
                        Button(action: {
                            beatValue += CGFloat(1)
                        }, label: {
                            Image(systemName: "plus")
                                .padding()
                                .clipShape(Circle())
                                .background(Color("Background")
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(15))
                                .foregroundColor(.white)
                                .font(.title2)
                        }) .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 40)
                        #else
                        Button(action: {
                            beatValue += CGFloat(1)
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.title2)
                                .frame(width: 50, height: 50)
                        })
                        .padding(.horizontal, 40)
                        #endif
                    }
                }
                
                // Play, Tap and Settings Buttons
                HStack {
                    // Play/Pause button
                    Button("", action: {
                        isOn.toggle()
                        isOn ? audioManager.play(bpm: beatValue) : audioManager.stop()
                    })
                        .buttonStyle(PlayButtonStyle(symbolName: "playpause"))
                        .foregroundColor(isOn ? Color("Blue") : .white)
                    
                    Spacer()
                    
                    // Tap button
                    Button("", action: {
                        tapValueFunc()
                    })
                        .buttonStyle(TapButtonStyle(buttonName: "Tap"))
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
            .preferredColorScheme(.light)
    }
}

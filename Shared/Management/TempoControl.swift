//
//  TempoControl.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 10.04.2022.
//

import Foundation

class TempoControl: ObservableObject {
    
    func whichTempo(pickerTempo: String, sliderTempo: Double) -> Double {
        if (pickerTempo == "Customize") {
            return sliderTempo
        }
        else {
            return Double(pickerTempo)!
        }
    }
    
    func whichTempoMarking(tempo: Double) -> String {
        switch(tempo) {
        case 200:
            return "Prestissimo"
        case 168...:
            return "Presto"
        case 156...:
            return "Vivace"
        case 120...:
            return "Allegro"
        case 108...:
            return "Moderato"
        case 76...:
            return "Andante"
        case 66...:
            return "Adagio"
        case 60...:
            return "Larghetto"
        case 45...:
            return "Lento"
        case 40...:
            return "Largo"
        case 25...:
            return "Grave"
        case 20...:
            return "Adagissimo"
        default:
            return "Metronome"
        }
    }
    
}

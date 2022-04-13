//
//  TempoControl.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 10.04.2022.
//

import Foundation

class TempoControl: ObservableObject {
    
    func whichTempoMarking(tempo: Double) -> String {
        switch(tempo) {
            case 24...40:
                return "Adagissimo"
            case 25...45:
                return "Grave"
            case 46...60:
                return "Lento"
            case 61...66:
                return "Larghetto"
            case 67...76:
                return "Adagio"
            case 77...108:
                return "Andante"
            case 109...120:
                return "Moderato"
            case 121...156:
                return "Allegro"
            case 157...176:
                return "Vivace"
            case 177...200:
                return "Presto"
            case 201...:
                return "Prestissimo"
            default:
                return "Larghissimo"
        }
    }
    
}

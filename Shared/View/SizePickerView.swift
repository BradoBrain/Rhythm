//
//  SizePickerView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 13.04.2022.
//

import SwiftUI

struct SizePickerView: View {
    @State private var size = "4"
    @State private var note = "4"
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                
                Picker("Measurement",
                       selection: $size) {
                    Group {
                        Text("1")
                        Text("2")
                        Text("3")
                        Text("4")
                        Text("5")
                        Text("6")
                        Text("7")
                        Text("8")
                    }
                    Group {
                        Text("9")
                        Text("10")
                        Text("11")
                        Text("12")
                        Text("13")
                        Text("14")
                        Text("15")
                        Text("16")
                    }
                }
#if os (macOS)
                       .pickerStyle(.automatic)
                       .frame(maxWidth: geometry.size.width / 2)
                       .clipped()
#else
                       .pickerStyle(.wheel)
                       .frame(maxWidth: geometry.size.width / 2)
                       .clipped()
#endif
                
                Divider()
                    .frame(height: 100)
                
                Picker("Notes",
                       selection: $note) {
                    Text("1")
                    Text("2")
                    Text("4")
                    Text("8")
                    Text("16")
                }
#if os (macOS)
                       .pickerStyle(.automatic)
                       .frame(maxWidth: geometry.size.width / 2)
                       .clipped()
#else
                       .pickerStyle(.wheel)
                       .frame(maxWidth: geometry.size.width / 2)
                       .clipped()
#endif
            }
        } .frame(width: 300, height: 100)
    }
}

struct SizePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SizePickerView()
    }
}

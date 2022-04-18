//
//  CustomSliderView.swift
//  Rhythm
//
//  Created by Artem Vinogradov on 12.04.2022.
//

import SwiftUI

struct CustomSliderView: View {
    
    @Binding var beatValue: CGFloat
    @State private var angleValue: CGFloat = 87.0
    
    let config = Config(minimumValue:   1.0,
                        maximumValue:   400.0,
                        totalValue:     400.0,
                        knobRadius:     15.0,
                        radius:         115.0)
    
    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .frame(width: config.radius * 2, height: config.radius * 2)
                .foregroundColor(.gray.opacity(0.8))
                .scaleEffect(1.2)
            
            // Scale circle
            Circle()
                .trim(from: 0.0, to: beatValue / config.totalValue)
                .stroke(Color.white,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .butt,
                                           dash: [1, 8.0321]))
                .frame(width: config.radius * 2, height: config.radius * 2)
                .rotationEffect(.degrees(-90))
            
            // Move indicator
            Circle()
                .fill(Color("Background"))
                .frame(width: config.knobRadius, height: config.knobRadius)
                .padding(10)
                .offset(y: -config.radius + 15)
                .rotationEffect(Angle.degrees(Double(beatValue / 1.12)))
                .gesture(DragGesture(minimumDistance: 0.0)
                    .onChanged{ value in
                        withAnimation(.linear(duration: 0.5)) {
                            change(location: value.location)
                        }
                    })
            
            // Flag circle
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(beatValue > 200 ? Color("Red") : Color("Blue"), lineWidth: 5)
                    .frame(width: config.radius * 2.5, height: config.radius * 2.5)
                    .rotationEffect(.degrees(180))
                
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(beatValue > 200 ? Color(.black) : Color("Yellow"), lineWidth: 5)
                    .frame(width: config.radius * 2.5, height: config.radius * 2.5)
            }
            
            // Value of bpm
            VStack {
                Text("\(Int(beatValue))")
                    .padding(.horizontal, 50)
                    .foregroundColor(.white)
                    .font(.title)
                
                Text("bpm").foregroundColor(.white)
            }
        }
    }
    
    private func change(location: CGPoint) {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0
        
        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        
        // convert angle value to beat value
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        
        if value >= config.minimumValue && value <= config.maximumValue {
            beatValue = value
            angleValue = fixedAngle * 180 / .pi // converting to degree
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(beatValue: .constant(100.0))
            .previewLayout(.sizeThatFits)
    }
}

struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}

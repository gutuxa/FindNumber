//
//  Slider.swift
//  FindNumber
//
//  Created by Oksana Tugusheva on 11.06.2021.
//

import SwiftUI

struct Slider: UIViewRepresentable {
    @Binding var value: Double
    
    let alpha: Double
    let range: ClosedRange<Int>
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(range.lowerBound)
        slider.maximumValue = Float(range.upperBound)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.onChange),
            for: .allTouchEvents
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension Slider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func onChange(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(value: .constant(50), alpha: 0.2, range: 1...100)
            .padding()
    }
}

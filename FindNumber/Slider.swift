//
//  Slider.swift
//  FindNumber
//
//  Created by Oksana Tugusheva on 11.06.2021.
//

import SwiftUI

struct Slider: UIViewRepresentable {
    @Binding var value: Float
    
    let score: Int
    let range: ClosedRange<Int>
    
    private var thumbAlpha: CGFloat {
        CGFloat(score) / CGFloat(range.upperBound)
    }
    
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
        uiView.value = value
        uiView.thumbTintColor = .red.withAlphaComponent(thumbAlpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension Slider {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func onChange(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(value: .constant(50), score: 20, range: 1...100)
            .padding()
    }
}

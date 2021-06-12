//
//  SliderBlock.swift
//  FindNumber
//
//  Created by Oksana Tugusheva on 11.06.2021.
//

import SwiftUI

struct SliderBlock: View {
    @Binding var value: Double
    
    let score: Int
    let range: ClosedRange<Int>
    
    var body: some View {
        HStack {
            Text("\(range.lowerBound)")
            Slider(value: $value, score: score, range: range)
            Text("\(range.upperBound)")
        }
    }
}

struct SliderBlock_Previews: PreviewProvider {
    static var previews: some View {
        SliderBlock(value: .constant(20), score: 2, range: 0...100)
            .padding()
    }
}

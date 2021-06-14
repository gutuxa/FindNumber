//
//  ContentView.swift
//  FindNumber
//
//  Created by Oksana Tugusheva on 11.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 0
    @State private var sliderValue = 50.0
    @State private var alertPresented = false
    
    let range = 0...100
    
    var body: some View {
        ZStack {
            Color(white: 0.98)
                .ignoresSafeArea()
            VStack {
                Text("Подвиньте слайдер\n как можно ближе к числу")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Text("\(targetValue)")
                    .font(.title)
                    .bold()
                    .padding()
                SliderBlock(
                    value: $sliderValue,
                    alpha: computeSliderAlpha(),
                    range: range
                )
                    .padding(.bottom, 60)
                PrimaryButton(title: "Проверь меня!", action: showScore)
                    .alert(isPresented: $alertPresented) {
                        Alert(
                            title: Text("Ваш счет"),
                            message: Text("\(computeScore())")
                        )
                    }
                PrimaryButton(title: "Начать заново", action: generateTarget)
                    .padding(.top)
            }
            .onAppear(perform: generateTarget)
            .padding()
        }
    }
    
    private func generateTarget() {
        targetValue = Int.random(in: range)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return range.upperBound - difference
    }
    
    private func computeSliderAlpha() -> Double {
        Double(computeScore()) / Double(range.upperBound)
    }
    
    private func showScore() {
        alertPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

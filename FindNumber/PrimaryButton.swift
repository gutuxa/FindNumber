//
//  PrimaryButton.swift
//  FindNumber
//
//  Created by Oksana Tugusheva on 11.06.2021.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .frame(maxWidth: .infinity, minHeight: 48)
            .foregroundColor(Color(white: 0.1))
            .background(Color(white: 0.93))
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color(white: 0.7))
            )
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Start", action:{}).padding()
    }
}

//
//  MyProgressViewStyle.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 2/9/26.
//

import SwiftUI

struct DollarProgressViewStyle: ProgressViewStyle {
    @State var rotationAngle: Angle = .zero
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: "dollarsign")
            .bold()
            .rotationEffect(rotationAngle)
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotationAngle = .radians(2 * .pi)
                }
            }
    }
}

extension ProgressViewStyle where Self == DollarProgressViewStyle {
    @MainActor @preconcurrency
    static var dollarRotating: DollarProgressViewStyle {
        DollarProgressViewStyle()
    }
}

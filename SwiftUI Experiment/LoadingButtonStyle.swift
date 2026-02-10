//
//  LoadingButtonStyle.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 2/9/26.
//

import SwiftUI

struct LoadingButtonStyle: ButtonStyle {
    @Binding var isLoading: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            if isLoading {
                ProgressView()
                    .foregroundStyle(.white)
                    .progressViewStyle(.dollarRotating)
            } else {
                configuration.label
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .clipShape(.capsule)
    }
}

#Preview {
    @Previewable @State var isLoading = false
    
    VStack {
        Button("Press me") {
            isLoading = true
            
            withAnimation(.linear.delay(6)) {
                isLoading = false
            }
        }
        .buttonStyle(LoadingButtonStyle(isLoading: $isLoading))
        .frame(width: 200, height: 40)
    }
}

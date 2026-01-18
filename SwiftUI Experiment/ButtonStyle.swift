//
//  ButtonStyle.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 1/16/26.
//

import SwiftUI

struct MyAppButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.largeTitle)
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .background(Color.green)
            .clipShape(.capsule)
            .foregroundStyle(.white)
    }
}


struct ABCView: View {
    @State var color = Color.red
    
    var body: some View {
        Button("My Button") {
            color = .green
        }
        .padding()
        .foregroundStyle(.white)
        .background(color)
        .onLongPressGesture(minimumDuration: 1.0, perform: {
            color = .yellow
        })
//        .buttonStyle(MyAppButtonStyle())
    
    }
}

#Preview {
    ABCView()
}

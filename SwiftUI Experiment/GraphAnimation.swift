//
//  GraphAnimation.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 1/27/26.
//

import SwiftUI

struct GraphAnimation: View {
   @State var graph: [(Int, Int, Color)] = [
        (1,1,.red),
        (2,1,.green),
        (3,1,.blue),
        (4,1,.cyan),
        (5,1,.yellow),
        (6,1,.pink),
    ]
    
    var body: some View {
        VStack {
            Button("Animate") {
                updateValue()
            }
            
            Spacer()
            
            HStack(alignment: .bottom) {
                ForEach(graph, id: \.0) { data in
                    Rectangle()
                        .fill(data.2)
                        .frame(width: 40, height: CGFloat(data.1 * 10), alignment: .bottom)
                }
            }
            .frame(width: 500, height: 500)
            .border(.red)
        }
        .frame(maxWidth: .infinity)
        .border(.black)
    }
    
    func updateValue() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation {
                for i in 0..<graph.count {
                    graph[i].1 = Int.random(in: 1...10)
                }
            }
//        }
    }
}

#Preview {
    GraphAnimation()
}

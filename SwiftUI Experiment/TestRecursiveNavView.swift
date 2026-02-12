//
//  TestRecursiveNav.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 2/12/26.
//

import SwiftUI

struct TestRecursiveNav: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Nav next") {
                    path.append((1...100).randomElement()!)
                }
            }
            .navigationDestination(for: Int.self) { value in
                VStack {
                    Text("This view: \(value)")
                    
                    Button("Nav next") {
                        path.append((1...100).randomElement()!)
                    }
                }
                .navigationTitle("This view: \(value)")
            }
        }
    }
}

#Preview {
    TestRecursiveNav()
}

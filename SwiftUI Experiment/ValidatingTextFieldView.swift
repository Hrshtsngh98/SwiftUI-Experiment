//
//  ValidatingTextFieldView.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 1/27/26.
//

import SwiftUI

struct ValidatingTextFieldView: View {
    @Binding var text: String
    let maxLength: Int

    @State private var internalText: String = ""
    
    @State private var myText: String = "" {
        didSet {
            print(myText)
        }
    }

    var body: some View {
        
        TextField("Name", text: $myText)
            .onChange(of: myText) { _, newValue in
                // Traditional approach: fix the value after it already changed
                if newValue.count > maxLength {
                    myText = String(newValue.prefix(maxLength))
                }
            }
        
        TextField("placeholder", text: $internalText)
            .onAppear { sync(from: text) }

            // User input path: internal -> filtered -> external
            .onChange(of: internalText) { _, newValue in
                let filtered = clamp(newValue)

                if internalText != filtered {
                    internalText = filtered
                }
                if text != filtered {
                    text = filtered
                }
            }

            // External updates path: external -> filtered -> internal
            .onChange(of: text) { _, newValue in
                sync(from: newValue)
            }
    }

    private func clamp(_ value: String) -> String {
        String(value.prefix(maxLength))
    }

    private func sync(from external: String) {
        let filtered = clamp(external)

        if internalText != filtered {
            internalText = filtered
        }
        if text != filtered {
            text = filtered
        }
    }
}


struct TryTextFieldViewTest: View {
    @State var text = ""
    var body: some View {
        VStack {
            ValidatingTextFieldView(text: $text, maxLength: 8)
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var text = ""
    VStack {
        ValidatingTextFieldView(text: $text, maxLength: 8)
    }
    .padding()
    
}

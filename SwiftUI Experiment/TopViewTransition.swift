//
//  TopViewTransition.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 2/7/26.
//

import SwiftUI

struct TopViewTransition: View {
    @State var showTopSheet = false
    @State var showBottomSheet = false
    let heights = stride(from: 0.1, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Button("Show top sheet") {
                    withAnimation {
                        showTopSheet.toggle()
                    }
                }
                
                Button("Show bottom sheet") {
                    showBottomSheet = true
                }
            }
            
            if showTopSheet {
                sheetView
                    .transition(.move(edge: .top))
            }
        }
        .sheet(isPresented: $showBottomSheet) {
            VStack {
                Text("Bottom sheet")
            }
            .presentationDetents(Set(heights))
            .presentationDragIndicator(.visible)
        }
    }
    
    var sheetView: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    Color.blue.opacity(0.5)
                    VStack {
                        Text("Top sheet")
                    }
                }
                .frame(width: geo.size.width, height: 300)
                .clipShape(.rect(corners: .concentric))
            }
        }
        .ignoresSafeArea()
        .contentShape(.rect) // tap outside blue area
        .onTapGesture {
            withAnimation {
                showTopSheet.toggle()
            }
        }
    }
}

#Preview {
    TopViewTransition()
}

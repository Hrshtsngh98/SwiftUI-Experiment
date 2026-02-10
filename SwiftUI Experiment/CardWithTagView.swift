//
//  CardWithTagView.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 2/9/26.
//

import SwiftUI

struct CardWithTagView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 24) {
                cardView(title: "Fragrence", subTitle: "5% cash back")
                cardView(title: "Race car", subTitle: "25% cash back")
            }
        }
        .contentMargins(.top, 80, for: .scrollContent)
        .padding()
        .background(.gray.opacity(0.2))
        .ignoresSafeArea()
    }
    func cardView(title: String, subTitle: String) -> some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Ad")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.3))
                        .clipShape(.rect(cornerRadius: 4))
                }
                Spacer()
            }
            
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.top, 16)
                
                Text(title)
                    .font(.caption)
                    .padding(.top, 8)
                Text(subTitle)
                
                Spacer()
                
                Button("Shop") {
                    
                }
                .font(.caption)
                
            }
        }
        .frame(height: 200)
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    CardWithTagView()
}

//
//  AccordionView.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 2/9/26.
//

import SwiftUI

struct AccordionView: View {
    @State var vm: AccordionViewVM = .init()
    @State var prevOpen: Int?
    @Namespace var animation
    
    var body: some View {
        ScrollView {
            ForEach(0..<vm.data.count, id: \.self) { i in
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .top) {
                        Text(vm.data[i].0)
                        Spacer()
                        Image(systemName: vm.data[i].2 ? "chevron.up" : "chevron.down")
                    }
                    .padding(.top, 20)
                    
                    if vm.data[i].2 {
                        Text(vm.data[i].1)
                    }
                }
                .frame(minHeight: 40)
                .contentShape(.rect)
                .onTapGesture {
                    toggleRow(i: i)
                }
            }
        }
        .padding()
    }
    
    func toggleRow(i: Int) {
        if i == prevOpen {
            withAnimation {
                vm.data[i].2.toggle()
            }
        } else {
            withAnimation(.linear) {
                if let prevOpen {
                    vm.data[prevOpen].2 = false
                }
                vm.data[i].2 = true
            }
        }
        prevOpen = i
    }
}

#Preview {
    AccordionView()
}


@Observable
class AccordionViewVM {
    var data: [(String, String, Bool)] = []
    
    let longString = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    init() {
        var newData: [(String, String, Bool)] = []
        for i in 1...3 {
            newData.append(("title \(i)", longString, false))
        }
        data = newData
    }
}

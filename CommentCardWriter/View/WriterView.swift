//
//  ContentView.swift
//  CommentCardWriter
//
//  Created by Jaswal, Eesa (SPH) on 04/02/2023.
//

import SwiftUI

struct WriterView: View {
    @ObservedObject var examples = Comment.exampleComments
    @State private var performedWell: Double = 50.0
    @State private var effort: Double = 50.0
    @State private var selectedDivision: String = "CMdpW-3 - LJH"
    let divisions: [String] = ["CMdpW-3 - LJH", "CMdaY-5 - AW", "CComX-1 - DPC", "CComX-1 - MC", "CPhyV-2 - PDAM"]
    
    @State private var value = 0
    let numbers: [Int] = [0,1,2,3,4,5,6,7,8,9,10]

    func incrementStep() {
        value += 1
        if value >= numbers.count { value = 0 }
    }

    func decrementStep() {
        value -= 1
        if value < 0 { value = numbers.count - 1 }
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Select your division:", selection: $selectedDivision) {
                    ForEach(divisions, id: \.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(.wheel).frame(height: 100)
            }
            
            Section(footer: Text("Have you performed well in assessed work?")) {
                Slider(value: $performedWell, in: 0...100.0)
            }
            
            Section(footer: Text("How much effort have you put into this subject?")) {
                Slider(value: $effort, in: 0...100.0)
            }
            
            Section() {
                Stepper {
                    Text("EWs not done / late  -   \(numbers[value].description)")
                        .foregroundColor(.gray)
                        .font(.callout)
                } onIncrement: {
                    incrementStep()
                } onDecrement: {
                    decrementStep()
                }
            }
            
            VStack {
                Button("Generate Comment", action: { examples.displayComment() })
                
                if examples.showComment == true {
                    Text(examples.comments.randomElement() ?? "No comment could be generated")
                }
            }

            Button(action: {
                let pasteboard = UIPasteboard.general
                pasteboard.string = examples.comments.randomElement()
            }) {
                Image(systemName: "doc.on.clipboard")
            }
        }
    }
}

struct WriterView_Previews: PreviewProvider {
    static var previews: some View {
        WriterView()
    }
}

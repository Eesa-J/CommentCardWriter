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
    
    
    var body: some View {
        Form {
            Section(footer: Text("Have you performed well in assessed work?")) {
                Slider(value: $performedWell, in: 0...100.0)
            }
            Section(footer: Text("How much effort have you put into this subject?")) {
                Slider(value: $effort, in: 0...100.0)
            }
            VStack {
                Button("Generate Comment", action: { examples.displayComment() })
                
                if examples.showComment == true {
                    Text(examples.comments.randomElement() ?? "No comment could be generated")
                } else {
                    Text("")
                }
                
                Button(action: { print("To Do") }) {
                    Image(systemName: "doc.on.clipboard")
                }
            }
        }
    }
}

struct WriterView_Previews: PreviewProvider {
    static var previews: some View {
        WriterView()
    }
}

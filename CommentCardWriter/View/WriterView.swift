//
//  ContentView.swift
//  CommentCardWriter
//
//  Created by Jaswal, Eesa (SPH) on 04/02/2023.
//

import SwiftUI

struct WriterView: View {
    @State private var showComment: Bool = false
    let examples = Comment.exampleComments
    
    var body: some View {
        VStack {
            Button("Generate Comment", action: { examples.displayComment() })
            if examples.showComment == true {
                Text(examples.comments.randomElement() ?? "No comment could be generated")
            } else {
                Text("")
            }
        }
    }
}

struct WriterView_Previews: PreviewProvider {
    static var previews: some View {
        WriterView()
    }
}

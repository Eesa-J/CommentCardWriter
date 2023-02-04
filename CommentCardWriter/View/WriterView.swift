//
//  ContentView.swift
//  CommentCardWriter
//
//  Created by Jaswal, Eesa (SPH) on 04/02/2023.
//

import SwiftUI
    var showComment = false

struct WriterView: View {
    var body: some View {
        VStack {
            Button("Generate Comment", action: { showComment() })
            if showComment == true {
                Text(comment)
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

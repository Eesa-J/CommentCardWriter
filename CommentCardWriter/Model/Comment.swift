//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Jaswal, Eesa (SPH) on 04/02/2023.
//

import Foundation

class Comment: ObservableObject {
    let comments: [String]
    @Published var showComment: Bool
    
    init(comments: [String], showcomment: Bool) {
        self.comments = comments
        self.showComment = showcomment
    }
    
    func displayComment() {
        showComment.toggle()
    }
    
    #if DEBUG
    static let exampleComments = Comment(comments: ["Comment 1","Comment 1","Comment 1"], showcomment: false)
    #endif
    
}

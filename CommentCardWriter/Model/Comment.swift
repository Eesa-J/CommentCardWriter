//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Jaswal, Eesa (SPH) on 04/02/2023.
//

import Foundation

class Comment {
    let comments: [String]
    var showComment: Bool
    
    init(comments: [String]) {
        self.comments = comments
        self.showComment = false
    }
    
    func displayComment() {
        showComment.toggle()
    }
    
}

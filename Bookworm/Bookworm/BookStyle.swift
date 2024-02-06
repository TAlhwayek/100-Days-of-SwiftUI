//
//  BookStyle.swift
//  Bookworm
//
//  Created by Tony Alhwayek on 2/5/24.
//

import SwiftUI

struct BookStyle: ViewModifier {
    let book: Book
    
    func body(content: Content) -> some View {
        switch book.rating {
        case 1:
            content
                .foregroundStyle(.red)
            
        case 2:
            content
                .foregroundStyle(.orange)
            
        case 3:
            content
                .foregroundStyle(.yellow)
            
        default:
            content
                .foregroundStyle(.white)
        }
    }
}

extension View {
    func bookStyle(for book: Book) -> some View {
        modifier(BookStyle(book: book))
    }
}

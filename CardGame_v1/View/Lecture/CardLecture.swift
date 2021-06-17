//
//  CardLecture.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/07.
//

import SwiftUI

struct CardLecture: View {
    
    var card: MemoryGame<String>.Card
    let shape = RoundedRectangle(cornerRadius: LayoutConstants.cornerRadious)
    
    var body: some View {
        
        GeometryReader { proxy in
        
            ZStack {
                
                if card.isFaceup {
                    shape
                        .fill().foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: LayoutConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: proxy.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape
                        .fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * LayoutConstants.fontScale)
    }
    
    private struct LayoutConstants {
        static let cornerRadious: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
    
}

struct CardLecture_Previews: PreviewProvider {
    static var previews: some View {
        CardLecture(card: MemoryGame<String>.Card.init(content: "😀", id: 1))
            .previewLayout(.fixed(width: 200, height: 300))
    }
}

//
//  CardLecture.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/07.
//

import SwiftUI

struct CardLecture: View {
    
    var card: MemoryGame<String>.Card
    let shape = RoundedRectangle(cornerRadius: 20)
    
    var body: some View {
        
        ZStack{
            
            if card.isFaceup {
                shape
                    .fill().foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
            
        }
    }
}

struct CardLecture_Previews: PreviewProvider {
    static var previews: some View {
        CardLecture(card: MemoryGame<String>.Card.init(content: "😀", id: 1))
            .previewLayout(.fixed(width: 200, height: 300))
    }
}

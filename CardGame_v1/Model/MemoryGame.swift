//
//  MemoryGame.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/03.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfParisOfCards: Int, createCardContent: (Int) -> CardContent) {
        
        for pairIdx in 0..<numberOfParisOfCards {
            let content = createCardContent(pairIdx)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceup: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
    }
}

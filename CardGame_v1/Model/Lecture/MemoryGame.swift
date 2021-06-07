//
//  MemoryGame.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/03.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceup.toggle()
        
    }
    
    func index(of card: Card) -> Int {
        
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0
    }
    
    init(numberOfParisOfCards: Int, createCardContent: (Int) -> CardContent) {
        
        self.cards = Array<Card>()
        
        for pairIdx in 0..<numberOfParisOfCards {
            
            let content = createCardContent(pairIdx)
            cards.append(Card(content: content, id: pairIdx * 2))
            cards.append(Card(content: content, id: pairIdx * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        
        var isFaceup: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

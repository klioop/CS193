//
//  MemoryGame.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/03.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    var indexOfOneAndTheOnlyOne: Int?
    
    mutating func choose(_ card: Card) {
        
//        if let chosenIndex = index(of: card) {
//            cards[chosenIndex].isFaceup.toggle()
//        }
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), // if let 이 나오면 , 는 && 과 같아짐
           !cards[chosenIndex].isFaceup,
           !cards[chosenIndex].isMatched
        {
            
            if let potentialMatchedIndex = indexOfOneAndTheOnlyOne {
                
                if cards[potentialMatchedIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                }
                indexOfOneAndTheOnlyOne = nil
                
            } else {
                
                for index in cards.indices {
                    cards[index].isFaceup = false
                }
                
                indexOfOneAndTheOnlyOne = chosenIndex
            }
            
            cards[chosenIndex].isFaceup.toggle()
        }
    }
    
    func index(of card: Card) -> Int? { // Array.fistIndex 가 이 함수를 대신함. Array Interface 를 자세히 공부할 필요가 있음
        for index in cards.indices { // cards.indices 는 0..<cards.count 와 같다.
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
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

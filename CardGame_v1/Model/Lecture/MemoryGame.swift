//
//  MemoryGame.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/03.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    var indexOfOneAndTheOnlyOne: Int? {
        
        get { cards.indices.filter({ cards[$0].isFaceup }).oneAndOnly }
        set { cards.indices.forEach{ cards[$0].isFaceup = ($0 == newValue) } }
    }
    
    var score = 0
    
    mutating func choose(_ card: Card) {
        
//        if let chosenIndex = index(of: card) {
//            cards[chosenIndex].isFaceup.toggle()
//        }
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), // if let 이 나오면 , 는 && 과 같아짐
           !cards[chosenIndex].isFaceup,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatchedIndex = indexOfOneAndTheOnlyOne {
                
                if cards[potentialMatchedIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                    self.score += 2
                    
                } else {
                    cards[chosenIndex].count += 1
                    cards[potentialMatchedIndex].count += 1
                    
                    if cards[chosenIndex].count >= 2 {
                        self.score -= 1
                    }
                    if cards[potentialMatchedIndex].count >= 2 {
                        self.score -= 1
                    }
                }
                
            } else {
                indexOfOneAndTheOnlyOne = chosenIndex
            }
            
            cards[chosenIndex].isFaceup = true
        }
    }
    
    // Array.fistIndex 가 이 함수를 대신함. Array Interface 를 자세히 공부할 필요가 있음
    func index(of card: Card) -> Int? {
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
            let card = Card(content: content, id: pairIdx * 2)
            
            if !cards.contains(where: { $0.content == card.content }) {
                cards.append(card)
                cards.append(Card(content: content, id: pairIdx * 2 + 1))
            }
//            cards.append(Card(content: content, id: pairIdx * 2))
//            cards.append(Card(content: content, id: pairIdx * 2 + 1))
        }
        
        cards.shuffle() // .shuffle() 은 기존 배열에서 섞고 .shuffled() 은 새로운 배열을 만들어서 섞음
    }
    
    struct Card: Identifiable {
        
        var count = 0
        var isFaceup: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
        
    }
}

extension Array {
    
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
    
}

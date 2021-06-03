//
//  EmojiMemoryGame.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/03.
//

import SwiftUI

class EmojiMemoryGame {
    
    // namespace 를 EmojiMemoryGame 으로 한정시키면서 동시에 글로벌 변수처럼 사용하기 위해서 static 을 let 앞에 써준다.
    static let vehicleEmojis = ["🚀", "🚁", "🚃", "🚂", "🚄", "🚅", "🚊", "🚒", "🚑", "🚐", "🚙", "🚚", "🚛", "🚜", "🚝", "🚞", "🚟"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfParisOfCards: 4) { index in // return 생략가능
            vehicleEmojis[index] // static 에선 EmojiMemoryGame.vehicleEmojis 라고 안써도 되지만 다른데서는 써야한다.
        }
    }
    
    private let model = createMemoryGame() // EmojiMemoryGame.createMemoryGame() 을 대신해서 줄여서 쓰게됨, viewModel 이 geatekeeper역할을 하기 때문에 model 에 private 을 걸어둠. 이 모델 뷰를 참조하는 뷰가 모델을 수정할 수 없도록함
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
}

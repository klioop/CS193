//
//  EmojiMemoryGame.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/03.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // MARK: - static functions
    
    static func themeOfGame(name: String, numberOfEmoji: Int ) -> ThemeModel {
        ThemeModel(name: name, numberOfPairsOfCards: numberOfEmoji)
    }
    
    // namespace 를 EmojiMemoryGame 으로 한정시키면서 동시에 글로벌 변수처럼 사용하기 위해서 static 을 let 앞에 써준다.
    // static let vehicleEmojis = ["🚀", "🚁", "🚃", "🚂", "🚄", "🚅", "🚊", "🚒", "🚑", "🚐", "🚙", "🚚", "🚛", "🚜", "🚝", "🚞", "🚟"]
    
    static func createMemoryGame(theme: ThemeModel) -> MemoryGame<String> {
        return MemoryGame(numberOfParisOfCards: theme.numberOfEmoji) { index in // return 생략가능
            let emojis = theme.emojisForCards()
            return emojis[index] // 같은 static 에선 EmojiMemoryGame.vehicleEmojis 라고 안써도 되지만 다른데서는 써야한다.
        }
    }
    
    // MARK: - model related
    
    private var models: [MemoryGame<String>]
    
    @Published private var model: MemoryGame<String> // EmojiMemoryGame.createMemoryGame() 을 대신해서 줄여서 쓰게됨, viewModel 이 geatekeeper 역할을 하기 때문에 model 에 private 을 걸어둠. 이 모델 뷰를 참조하는 뷰가 모델을 수정할 수 없도록 함
    // @Published property wrapper 를 사용하면 model 의 변수가 변할 때마다 objectWillChange.send() 메소드를 저절로 실행시킴
    
    var cards: Array<MemoryGame<String>.Card> { // 뷰 모델에서도 카드를 정의; 모델에서는 카드 컨텐트의 타입을 제너릭으로 정의했음; 뷰 모델에서 구체적 타입을 정의; 뷰 모델이 source of truth 가 됨
        model.cards
    }
    
    init() {
        let themes = ["vehicle", "fruit", "picto"]
        self.models = themes.map { EmojiMemoryGame.createMemoryGame(theme: EmojiMemoryGame.themeOfGame(name: $0, numberOfEmoji: 100)) }
        self.model = models[0]
    }
    
    // MARK: - User Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}

//
//  Theme.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/08.
//

import Foundation

struct ThemeModel {
    
    let numberOfPairsOfCards: Int
    var colorOfCards: String?
    private(set) var emojis: [String]
    
    init (name: String, numberOfPairsOfCards: Int, colorOfCards: String? = nil) {
        
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.colorOfCards = colorOfCards ?? "red"
        
        switch name {
        case "vehicle":
            self.emojis = ["🚀", "🚁", "🚃", "🚂", "🚄", "🚅", "🚊", "🚒", "🚑", "🚐", "🚙", "🚚", "🚛", "🚜", "🚝", "🚞", "🚟"]
        case "fruit":
            self.emojis = ["🍅", "🍇", "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🍎", "🍏", "🍐", "🍑", "🍒", "🍓", "🥑", "🥝", "🥥", "🥭", "🫐"]
        default:
            self.emojis =  ["🌠", "🎆", "🎇", "🎑", "🏙", "🏞", "🌁", "🗾", "🌃", "🌅", "🌄", "🌇", "🌉", "🌌", "🖼"]
        }
    }
    
    var numberOfEmoji: Int {
        if numberOfPairsOfCards > emojis.count {
            return emojis.count - 1
        } else {
            return numberOfPairsOfCards
        }
    }
    
    func emojisForCards() -> [String] {
        let temp = emojis.shuffled()
        return Array(temp[0...numberOfEmoji])
    }
    
    
}


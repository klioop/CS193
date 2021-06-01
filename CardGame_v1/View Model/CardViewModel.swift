//
//  CardViewModel.swift
//  CardGame_v1
//
//  Created by klioop on 2021/05/31.
//

import Foundation

enum Theme: String {
    case vehicle, fruit, picto
}

let vehicleEmojis: [String] = ["🚀", "🚁", "🚃", "🚂", "🚄", "🚅", "🚊", "🚒", "🚑", "🚐", "🚙", "🚚", "🚛", "🚜", "🚝", "🚞", "🚟"]
let fruitEmojis = ["🍅", "🍇", "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🍎", "🍏", "🍐", "🍑", "🍒", "🍓", "🥑", "🥝", "🥥", "🥭", "🫐"]
let pictoEmojis = ["🌠", "🎆", "🎇", "🎑", "🏙", "🏞", "🌁", "🗾", "🌃", "🌅", "🌄", "🌇", "🌉", "🌌", "🖼"]

class CardViewModel: ObservableObject {
    
    @Published var selectedEmojis: [String] = vehicleEmojis
    @Published var selectedTheme: String = "vehicle"
    
    
    func selectedEmojis(_ theme: Theme) {
        
        switch theme {
        
        case .vehicle:
            selectedTheme = "vehicle"
            let temp = vehicleEmojis.shuffled().prefix(upTo: Int.random(in: 4...vehicleEmojis.count))
            selectedEmojis = Array(temp)
        case .fruit:
            selectedTheme = "fruit"
            selectedEmojis = fruitEmojis.shuffled()
        case .picto:
            selectedTheme = "picto"
            selectedEmojis = pictoEmojis.shuffled()
        }
    }
    
}

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

class HomeViewModel: ObservableObject {
    
    @Published var selectedTheme: Theme = Theme.vehicle
    
    var selectedEmojis: [String] {
        
        switch selectedTheme {
        case .vehicle:
            let temp = vehicleEmojis.shuffled()[0..<Int.random(in: 5...vehicleEmojis.count)]
            return Array(temp)
        case .fruit:
            return fruitEmojis.shuffled()
        case .picto:
            return pictoEmojis.shuffled()
        }
    }
    
}

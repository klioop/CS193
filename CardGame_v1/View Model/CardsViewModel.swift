//
//  CardsViewModel.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/01.
//

import SwiftUI

class CardsViewModel: ObservableObject {
    
    let emojis: [String]
    
    init(emojis: [String]) {
        self.emojis = emojis
    }
    
    func gridItemWidth(_ emojis: [String]) -> CGFloat {
        
        if emojis.count <= 9 {
            return 120
        } else {
            return 70
        }
    }
    
}

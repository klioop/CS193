//
//  CardsView.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/01.
//

import SwiftUI

struct CardsView: View {
    
    @ObservedObject var cardsViewModel: CardsViewModel
    
    var body: some View {
        
        ScrollView {
            
            let emojis = cardsViewModel.emojis
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: cardsViewModel.gridItemWidth(emojis)))]) {
                
                ForEach(emojis, id: \.self) { emoji in
                    Card(emoji: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
                
            }
        }
    }
    
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(cardsViewModel: CardsViewModel(emojis: vehicleEmojis))
    }
}

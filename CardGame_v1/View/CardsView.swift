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
            let minimumWidth = cardsViewModel.gridItemWidth(emojis)
            
            let gridItems = [GridItem(.adaptive(minimum: minimumWidth))]
            
            LazyVGrid(columns: gridItems) {
                
                ForEach(emojis, id: \.self) { emoji in
                    Card(emoji: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .padding(.horizontal)
    }
    
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(cardsViewModel: CardsViewModel(emojis: vehicleEmojis))
    }
}

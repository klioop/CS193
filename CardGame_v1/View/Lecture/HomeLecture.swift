//
//  HomeLecture.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/07.
//

import SwiftUI

struct HomeLecture: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            
            Text("Memorize!")
                .font(.title)
                .fontWeight(.bold)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardLecture(card: card)
                        .aspectRatio(2 / 3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                }
                
            }
            .foregroundColor(.red)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct HomeLecture_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        let viewModel: EmojiMemoryGame = EmojiMemoryGame()
        HomeLecture(viewModel: viewModel)
    }
}

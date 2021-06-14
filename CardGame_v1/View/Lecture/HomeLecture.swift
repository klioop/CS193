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
            
            headerView
            
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
    
    var headerView: some View {
        HStack {
            
            Text("score: \(viewModel.score)")
                .padding(.leading)
                .font(.headline)
            
            Spacer()
            
            Text("Memorize!")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action:{
                viewModel.newGame()
            }) {
                Label("", systemImage: "plus.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 20))
            }
            .padding(.trailing)
        }
    }
}

struct HomeLecture_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        let viewModel: EmojiMemoryGame = EmojiMemoryGame()
        HomeLecture(viewModel: viewModel)
    }
}

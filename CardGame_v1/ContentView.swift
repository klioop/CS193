//
//  ContentView.swift
//  CardGame_v1
//
//  Created by klioop on 2021/05/31.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @ObservedObject var cardViewModel = CardViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Memorize!")
                .font(.title)
                .fontWeight(.bold)
            
            ScrollView {
                
                let emojis = cardViewModel.selectedEmojis
                LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemWidth(emojis)))] ) {
                    
                    ForEach(emojis, id: \.self) { emoji in
                        Card(emoji: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                    
                }
            }
            
            Spacer()
            
            HStack(spacing: 80) {
                
                ButtonForTheme(cardViewModel: cardViewModel, label: .vehicle, imageName: "car")
                ButtonForTheme(cardViewModel: cardViewModel, label: .fruit, imageName: "applelogo")
                ButtonForTheme(cardViewModel: cardViewModel, label: .picto, imageName: "applescript")
                
            }
            
        }
        .padding(.horizontal)
        
    }
    
    func gridItemWidth(_ emojis: [String]) -> CGFloat {
        
        if emojis.count <= 9 {
            return 120
        } else {
            return 70
        }
    }
}


struct ButtonForTheme: View {
    
    let cardViewModel: CardViewModel
    let label: Theme
    let imageName: String
    
    var buttonLabel: String {
        switch label {
        case .vehicle:
            return "Vehicle"
        case .fruit:
            return "Fruit"
        case .picto:
            return "Picto"
        }
    
    }
    
    var body: some View {
        
        Button(action: {
            cardViewModel.selectedEmojis(label)
        }, label: {
            
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(buttonLabel)
            }
                        
        })
    
        
    }
}


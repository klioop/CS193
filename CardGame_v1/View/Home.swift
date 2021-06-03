//
//  Home.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/02.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var isVehicle: Bool = true
    @State private var isFruit: Bool = false
    @State private var isPicto: Bool = false
    
    var body: some View {
        
        VStack {
            
            Text("Memorize!")
                .font(.title)
                .fontWeight(.bold)
            
            CardsView(cardsViewModel: CardsViewModel(emojis: homeViewModel.selectedEmojis))
            
            Spacer()
            
            HStack(spacing: 80) {
                
                ButtonForTheme(homeViewModel: homeViewModel, label: .vehicle, imageName: "car", isSelected: $isVehicle)
                ButtonForTheme(homeViewModel: homeViewModel, label: .fruit, imageName: "applelogo", isSelected: $isFruit)
                ButtonForTheme(homeViewModel: homeViewModel, label: .picto, imageName: "applescript", isSelected: $isPicto)
                
            }
            
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

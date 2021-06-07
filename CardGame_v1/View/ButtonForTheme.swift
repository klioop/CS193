//
//  ButtonForTheme.swift
//  CardGame_v1
//
//  Created by klioop on 2021/06/02.
//

import SwiftUI

struct ButtonForTheme: View {
    
    let homeViewModel: HomeViewModel
    let label: Theme
    let imageName: String
    @Binding var isSelected: Bool
    
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
            homeViewModel.selectedTheme = label
            isSelected.toggle()
        }, label: {
            
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(buttonLabel)
            }
            .foregroundColor(isSelected ? .green : .gray)
                        
        })
    
        
    }
}

struct ButtonForTheme_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForTheme(homeViewModel: HomeViewModel(), label: .vehicle, imageName: "car", isSelected: .constant(true))
            .previewLayout(.fixed(width: 200, height: 200))
    }
}

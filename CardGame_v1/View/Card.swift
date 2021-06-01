//
//  SwiftUIView.swift
//  CardGame_v1
//
//  Created by klioop on 2021/05/31.
//

import SwiftUI

struct Card: View {
    
    let emoji: String
    
    @State private var isFilpped: Bool = true
    
    var body: some View {
        
        ZStack {
            
            let shape = RoundedRectangle(cornerRadius: 8)
            
            Group{
                if isFilpped {
                    shape.fill(Color.white)
                    shape.strokeBorder(Color.red, lineWidth: 3)
                    Text(emoji)
                        .font(.largeTitle)
                } else {
                    shape.fill(Color.red)
                }
            }
            .onTapGesture {
                isFilpped = !isFilpped
            }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Card(emoji: "🚅")
            .previewLayout(.fixed(width: 200, height: 300))
        Card(emoji: "🚅")
            .colorScheme(.dark)
    }
}


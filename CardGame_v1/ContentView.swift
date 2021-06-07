//
//  ContentView.swift
//  CardGame_v1
//
//  Created by klioop on 2021/05/31.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HomeLecture(viewModel: EmojiMemoryGame())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

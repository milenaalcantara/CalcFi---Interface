//
//  TapView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 13/05/22.
//

import SwiftUI

struct TapView: View {
    @State var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}

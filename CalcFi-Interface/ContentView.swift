//
//  ContentView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SimulationsView(simulations: Simulation.sampleData, simulation: Simulation.sampleData[0])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

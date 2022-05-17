//
//  SimulationDetailView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 14/05/22.
//

import SwiftUI

struct SimulationDetailView: View {
    let simulation: Simulation
    
    var body: some View {
//        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
    }
}

struct SimulationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SimulationDetailView(simulation: Simulation.sampleData[0])
        }
    }
}

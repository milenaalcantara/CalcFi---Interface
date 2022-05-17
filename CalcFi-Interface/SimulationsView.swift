//
//  SimulationsListView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 10/05/22.
//

import SwiftUI

struct SimulationsView: View {
    let simulations: [Simulation]
    let simulation: Simulation
    
    @State private var isNewSimulation = false
//    @State private var isAddingNewSimulation = false
    
    var body: some View {
        List {
            ForEach(simulations) { simulation in
                NavigationLink(destination: SimulationDetailView(simulation: simulation)) {
                    SimulationCardView(simulation: simulation)
                }
            }
        }
        .navigationTitle("Simulações")
        .toolbar {
            Button(action: {
                isNewSimulation = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Simulation")
            .sheet(isPresented: $isNewSimulation) {
                SimulationFormView()
            }
            .task {
                isNewSimulation = false
            }
        }
        
    }
}

struct SimulationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SimulationsView(simulations: Simulation.sampleData, simulation: Simulation.sampleData[0])
        }
        
    }
}

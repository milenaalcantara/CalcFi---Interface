//
//  SimulationCardView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 14/05/22.
//

import SwiftUI

struct SimulationCardView: View {
    let simulation: Simulation
    
    var body: some View {
        HStack {
//            VStack {
                Text(simulation.name)

                Spacer()

                Text("R$ \(simulation.table.financedLiqValue.formatted(.number))")
                    .font(.caption)
//            }
//
//            Spacer()
//
//            Text("R$ \(simulation.simulationTable.financedLiqValue.formatted(.number))")
//                .font(.caption)
            
        }
    }
}

struct SimulationCardView_Previews: PreviewProvider {
    static var simulation = Simulation.sampleData[0]
    
    static var previews: some View {
        SimulationCardView(simulation: simulation)
    }
}

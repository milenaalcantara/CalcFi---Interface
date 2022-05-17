//
//  SimulationData.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 14/05/22.
//

import Foundation


class SimuationData: ObservableObject {
    @Published var simulations: [Simulation] = [Simulation.sampleData[0]]
    
    func deleteSimulation(_ simulation: Simulation) {
        simulations.removeAll { $0.id == simulation.id }
    }
    
    func addSimulation(_ simulation: Simulation) {
        simulations.append(simulation)
    }
    
//    func exists(_ simulation: Simulation) -> Bool {
//        simulations.contains(simulation)
//    }
    
//    func choiceSimulation(simulation: Simulation)
    
//    func choiceSimulation(simulation: Simulation) -> Binding<[Simulation]> {
//        Binding<[Simulation]> {
//            self.simulations
//        } set: { simulations in
//            for simulation in simulations {
//                if let index = self.simulations.firstIndex(where: { $0.id == simulation.id }) {
//                    self.simulations[index] = simulation
//                }
//            }
//        }
//    }
}

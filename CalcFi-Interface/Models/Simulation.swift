//
//  Simulation.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 10/05/22.
//

import Foundation


struct Simulation: Identifiable {
    var id = UUID()
    var name: String = ""
    
    var simulationTable: Table = PRICE(
        financedLiqValue: 0.0,
        interestRate: 0.0,
        numberOfParcel: 0
    )
    
//    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
//        self.id = id
//        self.title = title
//        self.attendees = attendees
//        self.lengthInMinutes = lengthInMinutes
//        self.theme = theme
//    }
}

extension Simulation {
    static let sampleData: [Simulation] = [
        Simulation(name: "Carro Gol G6", simulationTable: PRICE(financedLiqValue: 26000.00, interestRate: 1.75, numberOfParcel: 4)),
        Simulation(name: "Casa - Pacatuba", simulationTable: SAC(financedLiqValue: 165000.00, interestRate: 1.75, numberOfParcel: 360)),
        Simulation(name: "Bros", simulationTable: PRICE(financedLiqValue: 14000.00, interestRate: 1.75, numberOfParcel: 4))
    ]
}

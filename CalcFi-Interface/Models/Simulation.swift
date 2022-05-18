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
    
    var table: Table = PRICE(
        financedLiqValue: 0.0,
        interestRate: 0.0,
        numberOfParcel: 0
    )
}

extension Simulation {
    static let sampleData: [Simulation] = [
        Simulation(name: "Carro Gol G6", table: PRICE(financedLiqValue: 26000.00, interestRate: 1.75, numberOfParcel: 4)),
        Simulation(name: "Casa - Pacatuba", table: SAC(financedLiqValue: 165000.00, interestRate: 1.75, numberOfParcel: 360)),
        Simulation(name: "Bros", table: PRICE(financedLiqValue: 14000.00, interestRate: 1.75, numberOfParcel: 4))
    ]
}

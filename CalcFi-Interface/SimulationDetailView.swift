//
//  SimulationDetailView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 14/05/22.
//

import SwiftUI

struct SimulationDetailView: View {
    let simulation: Simulation
    
    @State private var count = 1
    
    var body: some View {
//        NavigationView {
        List {
//            HStack {
//                Text("Item: ")
//                Text(simulation.name)
//            }
            Section{
                HStack {
                    Text("Valor à financiar: ")
                    Text(simulation.simulationTable.financedLiqValue, format: .number)
                }
                
                HStack {
                    Text("Taxa a.m.: ")
                    Text(simulation.simulationTable.interestRate, format: .percent)
                }
                
                HStack {
                    Text("Nº de Parcelas: ")
                    Text(simulation.simulationTable.numberOfParcel, format: .number)
                }
            }
            
            Section {
                
//                count+=1
            }
//            Table(people) {
//                    TableColumn("Given Name", value: \.givenName)
//                    TableColumn("Family Name", value: \.familyName)
//            }
            
        }
        .navigationTitle(simulation.name)
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

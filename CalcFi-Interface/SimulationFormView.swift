//
//  SimulationView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 13/05/22.
//

import SwiftUI

struct SimulationFormView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var simulation: Simulation
    
    @State private var title: String = ""
    let tables = ["PRICE", "SAC"]
    @State private var selectedTable = "PRICE"
    @State private var liqValue: Double = 0.0
    @State private var interestRate: Double = 0.0
    @State private var numberOfParcel: Int = 0
    
    @State private var newSimulation = Table(financedLiqValue: 0.0, interestRate: 0.0, numberOfParcel: 0)
    @State private var isAddingNewSimulation = false
    
    @FocusState private var fieldIsFocused: Bool
    @FocusState private var stepperIsFocused: Bool
    
    func runTable() -> Table {
        switch selectedTable {
            case "PRICE":
                let price = PRICE(financedLiqValue: liqValue, interestRate: interestRate, numberOfParcel: numberOfParcel)
                    price.run()
                return price

            case "SAC":
                let sac = SAC(financedLiqValue: liqValue, interestRate: interestRate, numberOfParcel: numberOfParcel)
                    sac.run()
                return sac

            default:
                print("Opção inválida!")
        }
        
        return Table(financedLiqValue: 0.0, interestRate: 0.0, numberOfParcel: 0)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    HStack {
                        Text("Título: ")
                        TextField("Digite aqui...", text: $simulation.name)
                            .disableAutocorrection(true)
                            .focused($stepperIsFocused)
                    }
                    
                    HStack {
                        Text("Valor: ")
                        TextField("R$ 0,00", value: $simulation.table.financedLiqValue, format: .currency(code: "BRL")) // Locale.current.currencyCode ??
                            .disableAutocorrection(true)
                            .keyboardType(.decimalPad)
                            .focused($stepperIsFocused)
                    }
                    
                    HStack {
                        Text("Taxa a.m.: ")
                        TextField("Digite aqui...", value: $simulation.table.interestRate, format: .percent)
                            .disableAutocorrection(true)
                            .keyboardType(.decimalPad)
//                            .focused($fieldIsFocused)
                            .focused($stepperIsFocused)
                    }
                    
                    HStack {
                        Text("Nº Parcelas: ")
                        
                        TextField("Digite aqui...", value: $simulation.table.numberOfParcel, format: .number)
                            .disableAutocorrection(true)
                            .keyboardType(.decimalPad)
                            .focused($fieldIsFocused)
                        
                        if (fieldIsFocused == false) {
                            Stepper("", value: $numberOfParcel, in: 0...360)
                        }
                        

                            
                    }
                } header: {
                    Text("Preencha os valores")
                }
                
                Section{
                    Picker("", selection: $selectedTable) {
                        ForEach(tables, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Selecione a tabela base")
                }
                
//                Section {
//                    Button(action: {
//                        newSimulation = runTable()
//                        isAddingNewSimulation = true
//                    }) {
//                        Text("Calcular")
//                            .frame(maxWidth: .infinity, alignment: .center)
//                    }
//                    .accessibilityLabel("Calcular nova simulação")
//                    .foregroundColor(.orange)
//                    .buttonStyle(.automatic)
//                    .buttonBorderShape(.roundedRectangle)
//                }
            }
            .navigationTitle("Nova Simulação")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        fieldIsFocused = false
                        stepperIsFocused = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Calcular")
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .task {
            isAddingNewSimulation = false
        }
    }
}

struct SimulationFormView_Previews: PreviewProvider {
    static var previews: some View {
        SimulationFormView(simulation: .constant(Simulation.sampleData[0]))
    }
}

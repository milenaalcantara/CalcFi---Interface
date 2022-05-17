//
//  SimulationView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 13/05/22.
//

import SwiftUI

struct SimulationFormView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    let tables = ["PRICE", "SAC"]
    @State private var selectedTable = "PRICE"
    @State private var liqValue: Double = 0.0
    @State private var interestRate: Double = 0.0
    @State private var numberOfParcel: Int = 0
    
    @State private var newSimulation = TableBase(financedLiqValue: 0.0, interestRate: 0.0, numberOfParcel: 0)
    @State private var isAddingNewSimulation = false
    
    @FocusState private var fieldIsFocused: Bool
    @FocusState private var stepperIsFocused: Bool
    
    func runTable() -> TableBase {
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
        
        return TableBase(financedLiqValue: 0.0, interestRate: 0.0, numberOfParcel: 0)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    HStack {
                        Text("Título: ")
                        TextField("Digite aqui...", text: $title)
                            .disableAutocorrection(true)
//                            .focused($fieldIsFocused)
                            .focused($stepperIsFocused)
                    }
                    
                    HStack {
                        Text("Valor: ")
                        TextField("R$ 0,00", value: $liqValue, format: .currency(code: "BRL")) // Locale.current.currencyCode ??
                            .disableAutocorrection(true)
                            .keyboardType(.decimalPad)
//                            .focused($fieldIsFocused)
                            .focused($stepperIsFocused)
                    }
                    
                    HStack {
                        Text("Taxa a.m.: ")
                        TextField("Digite aqui...", value: $interestRate, format: .percent)
                            .disableAutocorrection(true)
                            .keyboardType(.decimalPad)
//                            .focused($fieldIsFocused)
                            .focused($stepperIsFocused)
                    }
                    
                    HStack {
                        Text("Nº Parcelas: ")
                        
                        TextField("Digite aqui...", value: $numberOfParcel, format: .number)
                            .disableAutocorrection(true)
                            .keyboardType(.decimalPad)
                            .focused($fieldIsFocused)
//                            .focused($stepperIsFocused)
                        
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
                
            }
            .navigationTitle("Nova Simulação")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        fieldIsFocused = false
                        stepperIsFocused = false
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button (action: {
                        newSimulation = runTable()
                        isAddingNewSimulation = true
                        dismiss()
                    }, label: {
                        Text("Calcular")
                    })
                }
                
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button (action: {
                        dismiss()
                    }, label: {
                        Text("Cancelar")
                    })
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
        SimulationFormView()
    }
}

//
//  Table.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 14/05/22.
//

import Foundation

class TableBase {
    
//    let tableName = "NAME"

    var financedLiqValue: Double
    var interestRate: Double
    var numberOfParcel: Int

    var interestValuesPerParcel: [Double]
    var debitValues: [Double]

    init(financedLiqValue: Double, interestRate: Double, numberOfParcel: Int) {
 
        self.financedLiqValue = financedLiqValue
        self.interestRate = interestRate / 100
        self.numberOfParcel = numberOfParcel

        self.interestValuesPerParcel = []

        self.debitValues = []
        self.debitValues.append(financedLiqValue)
    }

//    func printInitialValues() {
//        print("valor líquido financiado: R$ \(self.financedLiqValue)")
//        print("taxa de juros: R$ \(self.interestRate * 100)%")
//        print("número de parcelas: \(self.numberOfParcel)")
//    }

    

//    func run(){
//        print("Classe Mãe")
//    }
}

extension TableBase {
    func calcRateValue(debitValue: Double, interestRate: Double) -> Double {
        let rateValue = debitValue * interestRate
        interestValuesPerParcel.append(rateValue)

        return rateValue
    }
}

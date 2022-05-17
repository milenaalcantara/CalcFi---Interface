//
//  Sac.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 14/05/22.
//

import Foundation

class SAC: TableBase {
    let tableName = "SAC"
    
    var parcelValues: [Double] = []
    var rateValues: [Double] = []
    var amortizedValue: Double = 0.0

    func calcParcelValue(amortizedValue: Double, rateValue: Double) {
        let parcelValue = amortizedValue + rateValue
        self.parcelValues.append(parcelValue)
    }

    func calcValuesPerParcel() {
        self.amortizedValue = financedLiqValue / Double(numberOfParcel)

        for i in 0...(numberOfParcel - 1) {
            let rateValue = calcRateValue(debitValue: debitValues[i], interestRate: interestRate)

            calcParcelValue(amortizedValue: self.amortizedValue, rateValue: rateValue)

            let debitValue = debitValues[i] - amortizedValue
            debitValues.append(debitValue)
        }
    }


//    func printAllValues() {
//        print("\n::::::::::::::::::::::: Tabela \(tableName) :::::::::::::::::::::::\n")
//
//        for i in 0...(numberOfParcel - 1) {
//            print("""
//
//            Parcela \(i + 1):  R$ \(String(format: "%.2f", parcelValues[i])) | Valor de Juros: R$ \(String(format: "%.2f", interestValuesPerParcel[i])) | Valor Amortizado: R$ \(String(format: "%.2f", amortizedValue)) | Saldo devedor: \(String(format: "%.2f", debitValues[i + 1]))
//
//            Saldo devedor após pagamento da Parcela \(i + 1): R$ \(String(format: "%.2f", debitValues[i + 1]))
//
//            -------------------------------------------------------------
//            """)
//        }
//    }
}

extension SAC {
    func run() {
        calcValuesPerParcel()
        
    }
}

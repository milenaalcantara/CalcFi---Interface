//
//  Price.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 14/05/22.
//

import Foundation


class PRICE: Table {
    let tableName = "PRICE"

    var parcelValue: Double = 0.0
    var amortizationsPerParcel: [Double] = []


    func calcParcelValue(financedLiqValue: Double, interestRate: Double, numberOfParcel: Double) -> Double {
        let parcelValue = financedLiqValue * ((pow((1 + interestRate), numberOfParcel) * interestRate) / (pow((1 + interestRate), numberOfParcel) - 1))

        return parcelValue
    }
    
    func calcAmotizedValue(parcelValue: Double, interest: Double) -> Double {
        let amortizedValue = parcelValue - interest
        self.amortizationsPerParcel.append(amortizedValue)

        return amortizedValue
    }

    func calcValuesPerParcel() {
        var rateValue: Double
        var amortizedValue: Double
        var debitValue: Double
        
        if(numberOfParcel > 0) {
            for i in 0...(numberOfParcel - 1) {
                rateValue = calcRateValue(debitValue: debitValues[i], interestRate: interestRate)
                amortizedValue = self.calcAmotizedValue(parcelValue: parcelValue, interest: rateValue)
                debitValue = debitValues[i] - amortizedValue

                debitValues.append(debitValue)
            }
        } else {
            print("Não tem nada pra calcular aqui ...")
        }
    }


//    func printAllValues() {
//        print("\n::::::::::::::::::::::: Tabela \(tableName) :::::::::::::::::::::::\n")
//        print("--------------------------------------------------------------")
//
//        for i in 0...(numberOfParcel - 1) {
//            print("""
//
//            Parcela \(i + 1): R$ \(String(format: "%.2f", parcelValue))
//
//                Valor de Juros: R$ \(String(format: "%.2f", interestValuesPerParcel[i]))
//                Valor Amorizado: R$ \(String(format: "%.2f", amortizationsPerParcel[i]))
//
//            Saldo devedor após pagamento da Parcela \(i + 1): R$ \(String(format: "%.2f", debitValues[i + 1]))
//
//            -------------------------------------------------------------
//            """)
//        }
//    }
}

extension PRICE {
    func run() {
        parcelValue = calcParcelValue(
            financedLiqValue: financedLiqValue,
            interestRate: interestRate,
            numberOfParcel: Double(numberOfParcel)
        )

        calcValuesPerParcel()
    }
}

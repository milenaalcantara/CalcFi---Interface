//
//  FormView.swift
//  CalcFi-Interface
//
//  Created by Milena Lima de Alcântara on 13/05/22.
//

import SwiftUI

struct FormView: View {
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    
    var body: some View {
        Form {
            Section {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
               
            }
            
            Section {
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
            }
            
            ForEach(0..<100) {
                Text("Row \($0)")
            }
            
        }
        .navigationTitle("SwiftUI")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

//
//  ContentView.swift
//  DrAda
//
//  Created by Team ADA on 4/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var query="";
    @State var medicationList=MedicationList()
    
    
    var filteredMedications:[MedicationItem] {
        if query.isEmpty {
            return medicationList.getAllMedications()
        } else {
            return medicationList.getAllMedications().filter {
                $0.mainName.lowercased().contains(query.lowercased())
            }
        }
    }
    
    func MedicineDetail(_ medication: MedicationItem) -> some View {
        VStack {
            Text(medication.mainName)
            Text(medication.dosage)
            Text(medication.genericName)
            Text(medication.description)
            Text(medication.dosage)
        }
    }
    
    func buttonAddMedicine() -> some View {
        Button {
            print("Adding medication")
        } label: {
            Image(systemName: "plus.circle.fill")
        }
    }
    
    func showOneMedicine(_ medication: MedicationItem) -> some View {
        NavigationLink(destination: MedicineDetail(medication)) {
            VStack(alignment:.leading, spacing:20) {
                Text(medication.mainName)
                    .bold()
                    .font(.title3)
                HStack {
                    Text("Generic: \(medication.genericName)")
                    Spacer()
                    Text("Dosage:\(medication.dosage)")
                }
            }.padding()
                .listRowSeparator(.hidden)
                .background(RoundedRectangle(cornerRadius:10).fill(Color.blue))
            .foregroundColor(.white)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List(filteredMedications) { medication in
           showOneMedicine(medication)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Medications")
            .toolbar{
                buttonAddMedicine()
            }
        }
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search medications here") {
            ForEach(filteredMedications.prefix(4), id:\.id) {
                medication in Text(medication.mainName).searchCompletion(medication.mainName)
            }
        }
        .onAppear {
            // Run initialization code
            print("Running initialization code")

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

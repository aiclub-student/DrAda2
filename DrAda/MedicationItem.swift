//
//  MedicationItem.swift
//  DrAda
//
//  Created by Amit Gupta on 4/9/22.
//

import SwiftUI

struct MedicationItem: Codable, Equatable, Identifiable {
    var id=UUID()
    var mainName: String
    var genericName: String
    var description: String
    var instructions: String
    var sideEffects: String
    var dosage: String
    var frequency: Int
}

class MedicationList: Identifiable, Codable {
    var id=UUID()
    var medicationList=[MedicationItem]()
    
    func addMedication(medicationItem: MedicationItem) {
        print("Just called - addMedication(). TO-DO. Not implemented yet")
        return;   
    }
    
    func getOneMedication(mainName:String) -> MedicationItem {
        print("Just called - getOneMedication(). TO-DO. Not implemented yet")
        return medicationList[0]
    }
    
    func getAllMedications() -> [MedicationItem] {
        print("Just called - getAllMedications()")
        return medicationList
    }
    
    func updateMedication(mainName:String) -> Bool {
        print("Just called - updateMedication(). TO-DO. Not implemented yet")
        return true
    }
    
    func removeMedication(mainName:String) -> Bool {
        print("Just called - removeMedication(). TO-DO. Not implemented yet")
        return true
    }
    
    /*
     * Please do not call any functions below this line (from outside)
     *
     */
    
    private func getSampleData() -> [MedicationItem] {
        return [MedicationItem(mainName: "Tylenol", genericName: "Acetomephin", description: "Describe Tylenol", instructions: "Eat with food", sideEffects: "Lots of side-effects", dosage: "Up to 6x daily", frequency: 6),
                MedicationItem(mainName: "Dayquil", genericName: "Generic dayquil", description: "Describe Dayquil", instructions: "Eat with or food", sideEffects: "Lots of side-effects", dosage: "Up to 5x daily", frequency: 5),
        MedicationItem(mainName: "Alleve", genericName: "Ibuprofen", description: "Desc Alleve", instructions: "Eat without food", sideEffects: "No side-effects", dosage: "4x/day", frequency: 4),
                MedicationItem(mainName: "Ibuprofen", genericName: "Ibuprofen", description: "Desc Ibuprofen", instructions: "Eat with only food", sideEffects: "No side-effects", dosage: "3x/day", frequency: 3),
                MedicationItem(mainName: "Excedrin", genericName: "Tylenol+Caffiene", description: "Desc Excedrin", instructions: "Eat with out food", sideEffects: "No side-effects", dosage: "2x/day", frequency: 2)]
    }
    
    init() {
        medicationList=MedicationStore.getAllMedications()+getSampleData()
        print("Class MedicationList loaded all medications:",medicationList)
    }
}

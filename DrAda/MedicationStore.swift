//
//  MedicationStore.swift
//  DrAda
//
//  Created by Team ADA on 4/9/22.
//

import Foundation

class MedicationStore {
    
    static func setValue(valueInt: Int, valueKey: String) {
        let stateStore=UserDefaults.standard
        stateStore.set(valueInt, forKey: valueKey)
    }
    
    static func setValue(valueStr: String, valueKey: String) {
        let stateStore=UserDefaults.standard
        stateStore.set(valueStr, forKey: valueKey)
    }
    
    static func setValue(valueFloat: Float, valueKey: String) {
        let stateStore=UserDefaults.standard
        stateStore.set(valueFloat, forKey: valueKey)
    }
    
    static func setValue(valueDouble: Double, valueKey: String) {
        let stateStore=UserDefaults.standard
        stateStore.set(valueDouble, forKey: valueKey)
    }
    
    static func setValue(valueBool: Bool, valueKey: String) {
        let stateStore=UserDefaults.standard
        stateStore.set(valueBool, forKey: valueKey)
    }
    
    static func setValue(valueArray: [Any], valueKey: String) {
        let stateStore=UserDefaults.standard
        stateStore.set(valueArray, forKey: valueKey)
    }

    
    static func getValue(valueKey: String) -> Any? {
        let stateStore=UserDefaults.standard
        return stateStore.value(forKey: valueKey)
    }

    static func setMedication(valueMedication: MedicationItem) {
        let stateStore=UserDefaults.standard
        stateStore.set(valueMedication,forKey: valueMedication.mainName)
    }
    
    static func getMedication(name: String) -> MedicationItem {
        let v = getValue(valueKey: name)
        let m = v as! MedicationItem
        return m
    }
    
    static func getAllMedications() -> [MedicationItem] {
        let stateStore = UserDefaults.standard
        var a=[MedicationItem]()
        for (_, value) in stateStore.dictionaryRepresentation() {
            if let v = value as? MedicationItem {
            a.append(v)
            }
        }
        print("Initial load of medications:",a)
        return a
    }
    
    static func clearAll() {
        let stateStore = UserDefaults.standard
        for (key, _) in stateStore.dictionaryRepresentation() {
            stateStore.removeObject(forKey: key)
        }
    }
    
    static func dumpAllKeys_Values() {
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            print("Dump_All_Keys_Values: \(key) = \(value) \n")
        }
    }
    
    
}

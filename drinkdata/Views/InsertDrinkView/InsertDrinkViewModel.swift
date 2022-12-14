//
//  InsertDrinkViewModel.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 15.05.22.
//

import Foundation
import api
import SwiftUI

struct Participants {
    let name: String
    let id: Int
}

class InsertDrinkViewModel: ObservableObject {
    //TODO: Hier müssen noch default werde von API geholt und gespeichert werden
    @Published var selectedNames: [User] = [User(name: "Bene", id: 1)]
    @Published var selectedDrink: DrinkEnum = .kaffee1 {
        didSet {
            selectedVolume = self.selectedDrink.preferedVolume
        }
    }
    @Published var selectedVolume: VolumeEnum = .kaffee4
    @Published var data: [User] = [User(name: "Bene", id: 1), User(name: "Jojo", id: 2),User(name: "Dias", id: 3), User(name: "Tobi", id: 4), User(name: "Chris", id: 5)]
    @Published var availableVolumes: [VolumeEnum] = VolumeEnum.allCases
    @Published var consumedDrinks: [Drink] = []
    
    func sendDrink() {
        consumedDrinks.append(Drink(drink: selectedDrink, amount: selectedVolume, timestamp: NSDate.now))
        print(consumedDrinks)
    }
    
    func selectedNamesContain(elem: User) -> Bool {
       return selectedNames.contains(where: { user in
            user.id == elem.id
        })
    }
    
    func calculateCoffeineConsumed() {
        var consumedCoffeine: Double = 0.0
        self.consumedDrinks.forEach { elem in
            elem.amount.getLiteral(elem: <#T##DrinkEnum#>)
        }
    }
    
    private func getAmountInMl(volume: VolumeEnum) -> Double {
        
//        return switch volume {
//        case .kaffee4:
//
//        case .small:
//            <#code#>
//        case .large:
//            <#code#>
//        }
    }
    
    func toggleSelectionElement(selectable: User) {
        if let existingIndex = selectedNames.firstIndex(where: { $0.id == selectable.id }) {
            selectedNames.remove(at: existingIndex)
        } else {
            selectedNames.append(selectable)
        }
    }
}

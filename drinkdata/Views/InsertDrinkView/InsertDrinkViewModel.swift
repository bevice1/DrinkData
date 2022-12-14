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
    @Published var consumedCoffeine: Double = 0.0
    @Published var coffeineDecay: [(Int, Double)] = []
    
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
        consumedCoffeine = 0
        self.consumedDrinks.forEach { elem in
            consumedCoffeine += getAmountInMg(volume: elem.amount)
        }
        
        print(consumedCoffeine)
    }
    
    private func getAmountInMg(volume: VolumeEnum) -> Double {
        
        //return
        switch volume {
        case .kaffee4:
            return 125 * 0.5
        case .small:
            return 20 * 0.5
        case .large:
            return 250 * 0.5
        }
    }
    func calculateGraph() {
        calculateCoffeineConsumed()
        coffeineDecay = []
        coffeineDecay.append((0,consumedCoffeine))
        
        
        var t = 0
        while (coffeineDecay.last?.1 ?? 0 > 10) {
            t = t+1
            coffeineDecay.append((t, consumedCoffeine * exp(-0.173286*Double(t))))
        }
        print(coffeineDecay)
    }
    
    
    func toggleSelectionElement(selectable: User) {
        if let existingIndex = selectedNames.firstIndex(where: { $0.id == selectable.id }) {
            selectedNames.remove(at: existingIndex)
        } else {
            selectedNames.append(selectable)
        }
    }
}

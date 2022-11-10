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
    @Published var selectedVolume: VolumeEnum = .large
    @Published var data: [User] = [User(name: "Bene", id: 1), User(name: "Jojo", id: 2),User(name: "Dias", id: 3), User(name: "Tobi", id: 4), User(name: "Chris", id: 5)]
    @Published var availableVolumes: [VolumeEnum] = VolumeEnum.allCases
    
    func sendDrink() {
        selectedNames.forEach { name in
//            apicall. send(selectedDrink, selectedVolume)
            
        }
    }
    
    func selectedNamesContain(elem: User) -> Bool {
       return selectedNames.contains(where: { user in
            user.id == elem.id
        })
    }
    
    func toggleSelectionElement(selectable: User) {
        if let existingIndex = selectedNames.firstIndex(where: { $0.id == selectable.id }) {
            selectedNames.remove(at: existingIndex)
        } else {
            selectedNames.append(selectable)
        }
    }
}

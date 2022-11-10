//
//  ProfileViewModel.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 15.05.22.
//

import Foundation


class ProfileViewModel: ObservableObject {
    @Published var profil: Profile
    
    
    init () {
        let user = User(name: "Bene", id: 1)
        profil = Profile(name: user, drinks: [Drink(user: user, drink: .kaffee1, amount: .large, timestamp: NSDate().timeIntervalSince1970)])
    }
}

//
//  User.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 15.05.22.
//

import Foundation


struct User: CustomStringConvertible, Identifiable, Equatable {
    var description: String {
        name
    }
    
    let name: String
    let id: Int

}

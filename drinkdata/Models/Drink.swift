//
//  Drink.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 16.05.22.
//

import Foundation

enum DrinkEnum: CaseIterable, Identifiable, CustomStringConvertible {
    
    var description: String {
        literal
    }
    var preferedVolume: VolumeEnum {
        switch self {
        case .beer:
            return VolumeEnum.large
        case .wine:
            return VolumeEnum.small
        case .cocktail:
            return VolumeEnum.small
        case .shot:
            return VolumeEnum.shot
        case .trichter:
            return VolumeEnum.large
        }
    }
    
    case beer
    case wine
    case cocktail
    case shot
    case trichter
    
    var id: DrinkEnum {
        self
    }
    
    var literal: String {
        switch self {
        case .beer: return "Bier"
        case .wine: return "Wein"
        case .cocktail: return "Cocktail"
        case .shot: return "Shot"
        case .trichter: return "Trichter"
        }
    }
}


enum VolumeEnum: CaseIterable, Identifiable {

    case shot
    case small
    case large


    var id: VolumeEnum {
        self
    }
    
    func getLiteral(elem: DrinkEnum) -> String {
        switch self {
        case .shot:
            switch elem {
            case .beer: return "200ml"
            case .wine: return "200ml"
            case .cocktail: return "200ml"
            case .shot: return "20ml"
            case .trichter: return "500ml"
            }
        case .small:
            switch elem {
            case .beer: return "330ml"
            case .wine: return "330ml"
            case .cocktail: return "330ml"
            case .shot: return "40ml"
            case .trichter: return "500ml"
            }
        case .large:
            switch elem {
            case .beer: return "500ml"
            case .wine: return "Megapint"
            case .cocktail: return "500ml"
            case .shot: return "60ml"
            case .trichter: return "1L"
            }
        }
    }
}

struct Drink {
    
    let user: User
    let drink: DrinkEnum
    let amount: VolumeEnum
    let timestamp: Double
    
}

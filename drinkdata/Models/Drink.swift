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
        case .kaffee1:
            return VolumeEnum.kaffee4
        case .kaffee2:
            return VolumeEnum.small
        case .kaffee3:
            return VolumeEnum.small
        case .kaffee4:
            return VolumeEnum.kaffee4
        case .kaffee5:
            return VolumeEnum.large
        }
    }
    
    case kaffee1
    case kaffee2
    case kaffee3
    case kaffee4
    case kaffee5
//    case add
    
    var id: DrinkEnum {
        self
    }
    
    var literal: String {
        switch self {
        case .kaffee1: return "kaffee1"
        case .kaffee2: return "kaffee2"
        case .kaffee3: return "kaffee3"
        case .kaffee4: return "kaffee4"
        case .kaffee5: return "kaffee5"
//        case .add: return "add"
        }
    }
}


enum VolumeEnum: CaseIterable, Identifiable {

    case kaffee4
    case small
    case large


    var id: VolumeEnum {
        self
    }
    
    func getLiteral(elem: DrinkEnum) -> String {
        switch self {
        case .kaffee4:
            switch elem {
            case .kaffee1: return "20ml"
            case .kaffee2: return "20ml"
            case .kaffee3: return "20ml"
            case .kaffee4: return "20ml"
            case .kaffee5: return "20ml"
            }
        case .small:
            switch elem {
            case .kaffee1: return "125ml"
            case .kaffee2: return "125ml"
            case .kaffee3: return "125ml"
            case .kaffee4: return "125ml"
            case .kaffee5: return "125ml"
            }
        case .large:
            switch elem {
            case .kaffee1: return "250ml"
            case .kaffee2: return "250ml"
            case .kaffee3: return "250ml"
            case .kaffee4: return "60ml"
            case .kaffee5: return "1L"
            }
        }
    }
}

struct Drink {
    
    //let user: User
    let drink: DrinkEnum
    let amount: VolumeEnum
    let timestamp: Date
    
}

//
//  DrinkView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 16.05.22.
//

import SwiftUI

struct DrinkView: View {
    let drinkType: DrinkEnum
    var body: some View {
        Image(drinkType.literal)
            .resizable()
            .scaledToFill()
            

    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView(drinkType: .kaffee1)
    }
}

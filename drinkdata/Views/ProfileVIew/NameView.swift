//
//  NameView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 06.12.22.
//

import SwiftUI

struct NameView: View {
    var body: some View {
        VStack(spacing: 25) {
             HStack(spacing: 25) {
                        Spacer()
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text("Max Mustermann")
                            .font(.largeTitle)
                        Spacer()
                    }
             HStack {
                 VStack {
                     Text("80kg")
                     Text("Gewicht")
                 }
                 .frame(maxWidth: .infinity)
                 VStack {
                     Text("24")
                     Text("Alter")
                 }
                 .frame(maxWidth: .infinity)
                 VStack {
                     Text("178cm")
                     Text("Größe")
                 }
                 .frame(maxWidth: .infinity)
             }
         }.background {
             Image("beans")
                 .blur(radius: 5)
         }
                .foregroundColor(.white)
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}

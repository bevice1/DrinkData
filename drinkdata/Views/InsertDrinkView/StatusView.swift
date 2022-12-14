//
//  StatusView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 10.11.22.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
//        ZStack {
//            Image("beans")
//                .blur(radius: 10)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .padding([.leading, .trailing], 8)
                HStack() {
                    VStack {
                        Image("status_health")
                             .resizable()
                             .scaledToFit()
                        Text("OK")
                    }
                   
                    Spacer()
                    VStack {
                        Image("status_coffee")
                            .resizable()
                            .scaledToFit()
                        Text("Caffeine")
                    }
                   
                    Spacer()
                    
                    VStack {
                        Image("status_sleep")
                            .renderingMode(.template)
//                            .tint(Color("accent"))
                            .resizable()
                            .scaledToFit()
                        Text("Perfect sleep")
                    }
                    
                }
                
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 5)
                    }
            .background {
                        Image("beans")
                            .blur(radius: 5)
                
//            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}

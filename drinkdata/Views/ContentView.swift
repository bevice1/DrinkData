//
//  ContentView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 14.05.22.
//

import SwiftUI

struct ContentView: View {
    @State var endPoint: DrinkAPI = DrinkAPI()
    @ObservedObject var vm: InsertDrinkViewModel = InsertDrinkViewModel()
    @State var showProfileScreen = false {
        didSet {
            print("pressed")
        }
    }
    init(endPoint: DrinkAPI = DrinkAPI(), showProfileScreen: Bool = false) {
        self.endPoint = endPoint
        self.showProfileScreen = showProfileScreen
        
        UITabBar.appearance().backgroundColor = UIColor(Color("Tabbar"))
        UITabBar.appearance().unselectedItemTintColor = .systemGray3
    }
    
    var body: some View {
        
        TabView {
            InsertDrink(viewmodel: vm)
                .tabItem {
                    Image(systemName: "hammer.circle")
                    Text("Drink")
                }
                .accentColor(.white)
                .navigationTitle("Drinks")
                .navigationBarTitleDisplayMode(.inline)
            
            
            
            ProfileView(vm: vm)
                .tabItem {
                    Image(systemName: "person.fill")
                        .tint(.white)
                    Text("Drink")
                }
        }
        .tint(Color("Accent"))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

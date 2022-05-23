//
//  ContentView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 14.05.22.
//

import SwiftUI

struct ContentView: View {
    @State var endPoint: DrinkAPI = DrinkAPI()
    @State var showProfileScreen = false {
        didSet {
            print("pressed")
        }
    }
    var body: some View {
        
        NavigationView {
            
            InsertDrink()
                .tabItem {
                    Image(systemName: "hammer.circle")
                    Text("Drink")
                }
                .accentColor(.black)
                .navigationTitle("Drinks")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
              
                   
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 25)
                    }
                    

                    ToolbarItem(placement: .navigationBarTrailing) {
                        //                        Text("test")
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                showProfileScreen.toggle()
                            }
                            .padding(4)

                            .background(Color(uiColor: .systemTeal))
                            .mask {
                               Circle()
                            }
                            .padding(.trailing, 25)
                    }
//
                    
                    
                }
            
            
            NavigationLink("Profile Screen", isActive: $showProfileScreen) {
                ProfileView()
            }
            //                    .background(.black)
        }
//        .navigationViewStyle(StackNavigationViewStyle())
        
        
        
        
        
        
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

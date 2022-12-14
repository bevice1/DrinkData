//
//  InsertDrink.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 15.05.22.
//

import SwiftUI
import api

struct InsertDrink: View {
    @ObservedObject var viewmodel: InsertDrinkViewModel
    
    let title = "Select your drinker"
    let columns = [GridItem(.fixed(150), spacing: 16), GridItem(.fixed(150), spacing: 16)]
    var body: some View {
        VStack {
           StatusView()
                .frame(maxHeight: 100)
                
            
            ZStack {
                Color("Primary")
                
                VStack (alignment: .leading) {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            
                            ForEach(DrinkEnum.allCases) { elem in
                                DrinkView(drinkType: elem )
                                    .frame(width: 150, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .contentShape(RoundedRectangle(cornerRadius: 12))
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 15)
                                        
                                            .stroke(Color("Accent"), lineWidth: viewmodel.selectedDrink == elem ? 5 : 0)
                                        
                                    })
                                    .onTapGesture {
                                        print(elem.literal)
                                        viewmodel.selectedDrink = elem
                                    }
                            }
                        }
                        .padding([.top,.bottom], 5)
                    }
                    
                    HStack {
                        Spacer()
                        Text("select your volume")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    }
                    
                    VStack (spacing: 5) {
                        Picker("How much did you drink?", selection:
                                $viewmodel.selectedVolume) {
                            ForEach(viewmodel.availableVolumes)  { elem in
                                Text(elem.getLiteral(elem: viewmodel.selectedDrink))
                                    .foregroundColor(.white).tag(elem)
                                    
                            }
                        }
                        .foregroundColor(Color("Accent"))
                        .pickerStyle(.segmented)
                    }
                    .padding(.bottom, 10)
                    HStack {
                        Spacer()
                        Button {
                            viewmodel.sendDrink()
                        } label: {
                            HStack {
                                Text("Prost")
                                    .foregroundColor(.white)
                                Image(systemName: "drop")
                                    .foregroundColor(.white)
                            }
                            .font(Font.title2.weight(.bold))
                        }
                        
                        .padding(25)
                        .frame(width: 150, height: 50)
                        .background(viewmodel.selectedNames.isEmpty ? Color(uiColor: UIColor.systemGray4) : Color("Accent"))
                        .cornerRadius(12)
                        .disabled(viewmodel.selectedNames.isEmpty)
                        
                        
                        Spacer()
                    }
                }
                
                .padding()
            }
            
            .cornerRadius(10, corners: [.topLeft, .topRight])
            
            
        }
    }
}


struct InsertDrink_Previews: PreviewProvider {
    static var previews: some View {
        InsertDrink(viewmodel: InsertDrinkViewModel())
    }
}

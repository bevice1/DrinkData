//
//  InsertDrink.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 15.05.22.
//

import SwiftUI
import api

struct InsertDrink: View {
    @ObservedObject var viewmodel = InsertDrinkViewModel()
    
    let title = "Select your drinker"
    let columns = [GridItem(.fixed(150), spacing: 16), GridItem(.fixed(150), spacing: 16)]
    var body: some View {
        ZStack {
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
    
                                .stroke(Color("DarkTeal"), lineWidth: viewmodel.selectedDrink == elem ? 5 : 0)
                            
                        })
                        .onTapGesture {
                            print(elem.literal)
                            viewmodel.selectedDrink = elem
                        }
                    }
                }
                .padding([.top,.bottom], 5)
            }
//            .padding()
//            .background {
//
//
//                RoundedRectangle(cornerRadius: 8)
//                    .foregroundColor(Color(uiColor: UIColor.systemGray5))
//            }
            

//            Divider()
            HStack {
                Spacer()
                Text("select your volume")
                Spacer()
            }
           
            VStack (spacing: 5) {
                Picker("How much did you drink?", selection: $viewmodel.selectedVolume) {
                    ForEach(viewmodel.availableVolumes)  { elem in
                        Text(elem.getLiteral(elem: viewmodel.selectedDrink)).tag(elem)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding(.bottom, 10)
            
//            AddDrinkeView(viewmodel: viewmodel)
//                .frame(height: 50)
//                .padding([.bottom,.top], 10)
//            Spacer()
                
            HStack {
                Spacer()
//                Button {
//
//                } label: {
//                    HStack {
//                        Text("Alle trinken")
////                            .bold()
//                        Image(systemName: "person.3")
//                    }
//                    .font(Font.title3.weight(.bold))
//                    .foregroundColor(.teal)
//                    .minimumScaleFactor(0.9)
//
//                }
//                .padding(25)
//                .frame( height: 50)
//                .background(.white)
//
//                .cornerRadius(10)
//                .disabled(viewmodel.selectedNames.isEmpty)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color.teal, lineWidth: 3)
//                }
    

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
                .background(viewmodel.selectedNames.isEmpty ? Color(uiColor: UIColor.systemGray4) : Color.teal)
                .cornerRadius(12)
                .disabled(viewmodel.selectedNames.isEmpty)
       

                Spacer()
            }
//            .padding()
        }
//        .background(Color(UIColor.systemGray5))
        
        .padding()
        }
    }
}


struct InsertDrink_Previews: PreviewProvider {
    static var previews: some View {
        InsertDrink()
    }
}

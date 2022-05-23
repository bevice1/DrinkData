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
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ZStack {
            
//            Color(UIColor.systemGray5)
//                .ignoresSafeArea()
        VStack (alignment: .leading) {
//            InlinePicker(title: title, allowMultiselection: true, data: viewmodel.data, selected: $viewmodel.selectedNames) { elem, checked in
//                HStack(spacing: 16) {
//                    Text(elem.name)
//                    Spacer()
//                    if checked {
//                        Image(systemName: "checkmark")
//                    }
//                }
//                .foregroundColor(.black)
//
//            }
//            .modifier(FilledStyle())
//            .foregroundColor(Color(UIColor.secondarySystemFill))
//
//            HStack {
//                Spacer()
//                Text("Select your drink")
//                Spacer()
//            }
           
//            Divider()
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                   
                ForEach(DrinkEnum.allCases) { elem in
                    DrinkView(drinkType: elem )
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .contentShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 15)
    
                                .stroke(Color.blue, lineWidth: viewmodel.selectedDrink == elem ? 5 : 0)
                            
                        })
                        .onTapGesture {
                            print(elem.literal)
                            viewmodel.selectedDrink = elem
                        }
                    }
                }
                .padding([.top,.bottom], 5)
            }
            .padding()
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
            
            AddDrinkeView(viewmodel: viewmodel)
                .frame(height: 50)
                .padding([.bottom,.top], 10)
                
            HStack (alignment: .center){
//                Spacer()
                Button {
                    viewmodel.sendDrink()
                } label: {
                    HStack {
                        Text("Prost")
                            .foregroundColor(.white)
                            .font(.title2)
                        Image(systemName: "drop")
                            .foregroundColor(.white)
                    }
                  
                }
              
                .padding(25)
                .frame(width: 150, height: 50)
                .background(viewmodel.selectedNames.isEmpty ? Color(uiColor: UIColor.systemGray4) : Color.teal)
                
                .cornerRadius(12)
                .disabled(viewmodel.selectedNames.isEmpty)
       

                Spacer()
            }
            .padding()
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

//
//  AddDrinkeView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 22.05.22.
//

import SwiftUI

struct AddDrinkeView: View {
    @ObservedObject var viewmodel: InsertDrinkViewModel


    var body: some View {
    
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewmodel.data) { elem in
  
                     
                   
                    RoundedRectangle(cornerRadius: 10)
//                        .border(.gray, width: 5)
                        
                            
                        .frame(width: 75, height: 37.5)
                        .foregroundColor(viewmodel.selectedNames.contains(where: { user in
                            user.id == elem.id
                        }) ? .teal : Color(uiColor: .systemGray4))
                        .overlay(
                            
                             
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(viewmodel.selectedNamesContain(elem: elem) ? .blue : .gray, lineWidth: 3)
//                                .brightness(
                            
                        )
                        .onTapGesture {
                            viewmodel.toggleSelectionElement(selectable: elem)
                            
                        }
                    
                    
                }
            }
            .padding([.leading, .trailing], 5)

        }
        
    }
}


struct AddDrinkeView_Previews: PreviewProvider {
    static var previews: some View {
        AddDrinkeView(viewmodel: InsertDrinkViewModel())
    }
}
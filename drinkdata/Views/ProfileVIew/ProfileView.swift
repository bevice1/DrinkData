//
//  ProfileView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 15.05.22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Profile:")
            RoundedRectangle(cornerRadius: 15)

            
            Divider()
            
            Text("Add new User:")
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 150)
                .foregroundColor(.gray)
        }
        .padding()
       
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

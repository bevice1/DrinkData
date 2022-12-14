//
//  ProfileView.swift
//  drinkdata
//
//  Created by Benedikt Kaiser on 15.05.22.
//

import SwiftUI
import Charts

struct ProfileView: View {
    @ObservedObject var vm: InsertDrinkViewModel
    
    
    
    var body: some View {
        //        ScrollView {
        VStack {
            NameView()
                .frame(maxHeight: 150)
            ZStack {
                Color("Primary").ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                            Button( action: {
                            } ,label: {
                                Label("Favoriten", systemImage: "heart.fill")
                                Spacer()
                                    .frame(maxWidth: 50)
                                
                                Image(systemName: "chevron.forward")
                            })
                            Button( action: {
                            } ,label: {
                                Label("Koffein Level", systemImage: "chart.line.uptrend.xyaxis.circle")
                                Spacer()
                                    .frame(maxWidth: 50)
                                
                                Image(systemName: "chevron.forward")
                            })
                            .foregroundColor(Color(UIColor.systemGray5))
                            Label("Getrunkener Koffein", systemImage: "cup.and.saucer.fill")
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color(UIColor.systemGray5))
                                .frame(minHeight: 50, maxHeight: 100)
                            Label("Ready to sleep", systemImage: "powersleep")
                            Chart {
                                //                            ForEach(Array(data.enumerated()), id: \.offset) { item in
                                ForEach(Array(vm.coffeineDecay), id: \.0) { time, value in
                                    LineMark(
                                        x: .value("Hours", time),
                                        y: .value("Coffeine", value),
                                        series: .value("coffeine", "coffeineLabel")
                                        
                                        
                                    )
                                    LineMark(
                                        x: .value("sleep", time), y: .value("sleep", 50),
                                        series: .value("sleep", "sleep")
                                    )
                                    .foregroundStyle(.red)
                                }
                            }
                            
                            .frame(height: 100)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding(20)
                
            }
            //        }
            .cornerRadius(10,  corners: [.topRight, .topLeft])
        }
        .onAppear {
            vm.calculateGraph()
        }
    }
}

struct ProfileCharacter: View {
    let character: String
    var body: some View {
        
        HStack() {
            
            Image(systemName: "arrow.right")
            Text(character)
        }
        .padding(.leading, 0)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: InsertDrinkViewModel())
    }
}

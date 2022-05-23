//
//  SwiftUIView.swift
//
//
//  Created by Kaiser Benedikt on 31.03.22.
//

import SwiftUI

struct OutlinedStyle: ViewModifier {
    @State private var isEditing = false
    var currentBorderColor: Color = .gray
//    @Environment(\.bslTextfieldOutlinedBorderRadius) private var borderRadius: CGFloat
    let boarderRadius: CGFloat = 8
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: boarderRadius)
                .stroke(currentBorderColor, lineWidth: isEditing ? 2 : 1))
    }
}

struct FilledStyle: ViewModifier {
    var currentUnderlineColor: Color = .gray
    @State private var isEditing = false
    let backgroundColor: Color = .gray
    let backgroundCornerRadius: CGFloat = 8
    func body(content: Content) -> some View {
        content.background(
            ZStack {
                RoundedRectangle(cornerRadius: backgroundCornerRadius)
                VStack {
                    
                    Rectangle()
                        .fill(currentUnderlineColor)
                        .frame(height: isEditing ? 2 : 3).frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: -1.2)
//                    Rectangle()
//                        .fill(.white)
//                        .frame(height: isEditing ? 4 : 2).frame(maxHeight: .infinity, alignment: .bottom)
//                        .offset(y: 0)
                }
            }
        )
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Kaiser Benedikt on 31.03.22.
//

import SwiftUI

@available(iOS 14.0, *)
struct InlinePicker<PickerElement: Identifiable & CustomStringConvertible, PickerRowView: View>: View {
    @Binding var selected: [PickerElement]
    var title: String
    let content: (PickerElement, Bool) -> PickerRowView
    var allowMultiSelection: Bool = true
    var data: [PickerElement]
    var active: Bool {
        return selected.count > 0 ? true : false
    }
    @State var isExpanded: Bool = false
    
    let placeholderFont = Font.system(size: 12)
    let placeholderColor: Color = .gray
    let foregroundColor: Color = .black
    
    init(title: String, allowMultiselection: Bool, data: [PickerElement], selected: Binding<[PickerElement]>,
         
         elementLabel content: @escaping (PickerElement, Bool) -> PickerRowView) {
        _selected = selected
        self.content = content
        self.data = data
        self.allowMultiSelection = allowMultiselection
        self.title = title
    }
    
    var body: some View {
        
        LazyVStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    
                
                Text("\(title)")
                    .font(.system(size: active ? 12 : 15))
                    .offset(y: active ? -8 : 7.5)
                    .foregroundColor(placeholderColor)
                Text(selected.map { $0.description }.joined(separator: ", "))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(foregroundColor)
                }
                Spacer()
                Image(systemName: "arrow.up.circle.fill")
                    .rotationEffect(Angle(degrees: isExpanded ? 180 : 0))
                    .foregroundColor(placeholderColor)
                    .padding()
            }
       
            if isExpanded {
                Divider()
                ForEach(data, id: \.id) { elem in
                    Button(action: {
                        toggleSelection(selectable: elem)
                    }) {
                        VStack {
                            
                        
                        content(elem, selected.contains {
                            $0.id == elem.id
                        })
                        
//                        .lineLimit(1)
//                        .allowsTightening(true)
                        .padding()
                       
                            if elem.id != data.last?.id {
                                Divider()
                            }
                                
                        }
                        .padding([.leading])
                    }
                 
                }
//                .animation(.spring())
//                .transition(.asymmetric(insertion: .opacity, removal: .identity))
//                .transition()
            }
        }
        .padding([.leading,.top,.bottom])
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeIn) {
                isExpanded.toggle()
            }
          
        }
  
    }
    
    private func toggleSelection(selectable: PickerElement) {
        if allowMultiSelection {
            if let existingIndex = selected.firstIndex(where: { $0.id == selectable.id }) {
                selected.remove(at: existingIndex)
            } else {
                selected.append(selectable)
            }
        } else {
            selected = [selectable]
        }
    }
}

#if DEBUG

struct InlinePickerPreviewRow: View {
    let title: String
    let checked: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Text(title)
            Spacer()
            if checked {
                Image(systemName: "checkmark")
            }
        }
    }
}

@available(iOS 14.0, *)
struct InlinePicker_Preview: PreviewProvider {
    @State static var selectedExamples: [ExampleEnum] = []
    @State static var selectedExamplesFull: [ExampleEnum] = [.exampleOne, .exampleTwo, .exampleThree, .exampleFour, .exampleFive, .exampleSix]
    @State static var selectedExamplesOne: [ExampleEnum] = [.exampleOne, .exampleTwo]
    static let title = "DemoPicker"
    
    enum ExampleEnum: Int, CaseIterable, Identifiable, CustomStringConvertible {
        var description: String {
            literal
        }
        
        case exampleOne = 0
        case exampleTwo
        case exampleThree
        case exampleFour
        case exampleFive
        case exampleSix
        
        var id: ExampleEnum {
            self
        }
        
        var literal: String {
            switch self {
            case .exampleOne: return "exampleOne"
            case .exampleTwo: return "exampleTwo"
            case .exampleThree: return "reallyLongExampleThree"
            case .exampleFour: return "reallyLongExampleexampleFour"
            case .exampleFive: return "exampleFive"
            case .exampleSix: return "exampleSix"
            }
        }
    }
    
    
    
    static var previews: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    
                    InlinePicker(title: "CustomPicker", allowMultiselection: true, data: ExampleEnum.allCases, selected: $selectedExamples) { elem, checked in
                        InlinePickerPreviewRow(title: elem.literal, checked: checked)
                    }
                    
                    
                    
                    InlinePicker(title: "CustomPicker",  allowMultiselection: true, data: ExampleEnum.allCases, selected: $selectedExamplesOne) { elem, checked in
                        InlinePickerPreviewRow(title: elem.literal, checked: checked)

                    }
                    .modifier(OutlinedStyle())
                    
                    
                    InlinePicker(title: "CustomPicker", allowMultiselection: true, data: ExampleEnum.allCases, selected: $selectedExamplesFull) { elem, checked in
                        InlinePickerPreviewRow(title: elem.literal, checked: checked)

                    }
                    .modifier(FilledStyle())
                    
                    
                }
                .padding()
            }
            .navigationBarTitle(title, displayMode: .inline)
        }
    }
        
}
#endif

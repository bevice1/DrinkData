//
//  ImagePicker.swift
//  CustomPicker
//
//  Created by Kaiser Benedikt on 22.03.22.
//

import SwiftUI

@available(iOS 14.0, *)
public struct MultiSelectPicker<PickerElement: Identifiable & CustomStringConvertible, PickerRowView: View>: View {
    @Binding var selected: [PickerElement]
    var title: String
    let content: (PickerElement, Bool) -> PickerRowView
    var allowMultiSelection = true
    var data: [PickerElement]
    var active: Bool {
        return selected.count > 0 ? true : false
    }
        
    let placeholderFont = Font.system(size: 12)
    let placeholderColor: Color = .gray
    let foregroundColor: Color = .black
   

    public init(title: String, data: [PickerElement], selected: Binding<[PickerElement]>,

         elementLabel content: @escaping (PickerElement, Bool) -> PickerRowView) {
        _selected = selected
        self.content = content
        self.data = data
        self.title = title
    }

    public var body: some View {
        NavigationLink {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(data, id: \.id) { elem in
                        Button(action: {
                            toggleSelection(selectable: elem)
                        }) {
                            content(elem, selected.contains {
                                $0.id == elem.id
                            })
                            .navigationBarTitle(title, displayMode: .inline)
                        }
                        .padding()
                    }
                }
            }
        } label: {
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
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(placeholderColor)
            }
            .padding()
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

    struct MultiSelectPickerPreviewRow: View {
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
    struct MultiSelectPicker_Previews: PreviewProvider {
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
                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamples) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }
                        .modifier(FilledStyle())

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamplesOne) { elem, checked in
                            
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }
                        .modifier(FilledStyle())

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamplesFull) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }
                        .modifier(FilledStyle())

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamples) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }
                        .modifier(OutlinedStyle())

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamplesOne) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }
                        .modifier(OutlinedStyle())

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamplesFull) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }
                        .modifier(OutlinedStyle())

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamples) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamplesOne) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }

                        MultiSelectPicker(title: "CustomPicker", data: ExampleEnum.allCases, selected: $selectedExamplesFull) { elem, checked in
                            MultiSelectPickerPreviewRow(title: elem.literal, checked: checked)
                        }
                    }
                    .padding()
                }
                .navigationBarTitle(title, displayMode: .inline)
            }
        }
    }
#endif

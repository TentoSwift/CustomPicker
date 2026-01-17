//
//  CustomPicker.swift
//  CustomPicker
//
//  Created by Tento on 2026/01/16.
//

import SwiftUI

@available(watchOS, unavailable)
public struct CustomPickerView<T: Item>: View {
    
    @Binding var selection: T
    @Binding var isSortAscending: Bool
    
    private let title: String
    
    public init(selection: Binding<T>, isSortAscending: Binding<Bool>, title: String = "表示順") {
        self._selection = selection
        self._isSortAscending = isSortAscending
        self.title = title
    }
    
    // MARK: - Logic Helpers
    
    private func isSelected(type: T) -> Bool {
        selection == type
    }
    
    private var invertedSortAscending: Binding<Bool> {
        Binding(
            get: { !isSortAscending },
            set: { isSortAscending = !$0 }
        )
    }
    
    // MARK: - Body
    
    @available(watchOS 6.0, *)
    public var body: some View {
            Section {
                ForEach(Array(T.allCases), id: \.self) { type in
                    if isSelected(type: type) {
                        if isSortAscending {
                            Toggle(isOn: $isSortAscending) {
                                Text(type.label)
                                Text(type.firstLabel)
                            }
                        } else {
                            Toggle(isOn: invertedSortAscending) {
                                Text(type.label)
                                Text(type.secondLabel)
                            }
                        }
                    } else {
                        Button(type.label) {
                            selection = type
                            isSortAscending = true
                        }
                    }
                }
            }
        }
    }

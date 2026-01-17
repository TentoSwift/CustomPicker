//
//  Item.swift
//  CustomPicker
//
//  Created by Tento on 2026/01/16.
//

import Foundation

public protocol Item: CaseIterable, Hashable {
    var label: String { get }
    var firstLabel: String { get }
    var secondLabel: String { get }
}

//
//  Item.swift
//  AnimeLand
//
//  Created by 梁非凡 on 2023/11/11.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

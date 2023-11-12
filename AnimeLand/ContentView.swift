       //
//  ContentView.swift
//  AnimeLand
//
//  Created by 梁非凡 on 2023/11/11.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var name = ""
    var body: some View {
        Home()

    }
    

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

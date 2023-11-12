//
//  Home.swift
//  AnimeLand
//
//  Created by 梁非凡 on 2023/11/11.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var network: Network
    @State var recommendations: [RecommendedAnime] = []
    var body: some View {
        ScrollView {
            VStack {
                Text("All users")
                .font(.title).bold()
                if (recommendations.isEmpty) {
          
                } else {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(recommendations, id: \.self) { recomendation in
    
                                AsyncImage(url: URL(string: recomendation.entry[0].images.jpg.image_url)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } else if phase.error != nil {
                                        Text("There was an error loading the image.")
                                    } else {
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                            .background(.red)
                                            .cornerRadius(4)
                                    }
                                }
                                .frame(width: 100)
            
                                Text("Dick")


                            }
                        }
                        .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude)
                    }
                }
            }
            
        }
        .onAppear {
            Task {
                try await recommendations = network.fetchRecommendations()
            }


        }
    }
}

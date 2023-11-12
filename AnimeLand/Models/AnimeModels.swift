//
//  AnimeModels.swift
//  AnimeLand
//
//  Created by 梁非凡 on 2023/11/11.
//

import Foundation

struct RecommendedAnime: Decodable, Identifiable, Hashable{
    var id: UUID?
    var mal_id: String
    var entry: [AnimeEntry]
}

struct AnimeEntry: Decodable, Hashable, Equatable, Identifiable{
    static func == (lhs: AnimeEntry, rhs: AnimeEntry) -> Bool {
        return lhs.mal_id == rhs.mal_id
    }
    
    var id: UUID?
    var mal_id: Int
    var url: String
    var images: AnimeImage
    func hash(into hasher: inout Hasher) {
        hasher.combine(mal_id)
    }
}

struct AnimeModel: Decodable, Identifiable {
    var id: UUID?
    var mal_id: String
    var url: String
    var images: AnimeImage
    
    enum CodingKeys: CodingKey {
        case mal_id
        case url
        case images
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mal_id = try container.decode(String.self, forKey: .mal_id)
        self.url = try container.decode(String.self, forKey: .url)
        self.images = try container.decode(AnimeImage.self, forKey: .images)
    }
}

struct AnimeImage: Decodable {
    var jpg: jpgImage
}

struct jpgImage: Decodable {
    var image_url: String
    var small_image_url: String
    var large_image_url: String
}



import SwiftUI

class Network: ObservableObject {
    
    func fetchRecommendations() async throws -> [RecommendedAnime] {
        guard let url = URL(string: "https://api.jikan.moe/v4/recommendations/anime") else { fatalError("Missing URL") }
        var recommendations:[RecommendedAnime] = []
        let (data, response) = try await URLSession.shared.data(from: url)
        let httpResponse = response as? HTTPURLResponse
        do {
            let responseData = try JSONDecoder().decode(RecommendResponseModel.self, from: data)
            recommendations = responseData.data
        } catch {
            print(error)
        }
        return recommendations
    }
    
    
    func getAnimeById(animeId: String) async throws -> AnimeModel {
        guard let url = URL(string: "https://api.jikan.moe/v4/anime/\(animeId)/full") else { fatalError("Missing URL") }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let httpResponse = response as? HTTPURLResponse
        
        let responseData = try JSONDecoder().decode(AnimeResponseMOdel.self, from: data)
        let animeData = responseData.data
        
        return animeData
    }
    
    
    
}

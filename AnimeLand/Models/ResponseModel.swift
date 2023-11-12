//
//  ResponseModel.swift
//  AnimeLand
//
//  Created by 梁非凡 on 2023/11/11.
//

import Foundation

struct RecommendResponseModel : Decodable{
    var data: [RecommendedAnime]
}

struct AnimeResponseMOdel: Decodable {
    var data: AnimeModel
}

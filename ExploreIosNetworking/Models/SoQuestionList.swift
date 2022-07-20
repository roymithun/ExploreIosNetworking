//
//  SoQuestionList.swift
//  ExploreNetworking
//
//  Created by Mithun Roy on 20/07/2022.
//

import Foundation

struct SoQuestionList: Decodable {
    let items: [SoQuestion]
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

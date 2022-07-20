//
//  SoQuestion.swift
//  ExploreNetworking
//
//  Created by Mithun Roy on 20/07/2022.
//

import Foundation

struct SoQuestion: Decodable {
    let questionId: Int
    let isAnswered: Bool
    let viewCount: Int
    let answerCount: Int
    let lastActivityDate: Int
    let creationDate: Int
    let score: Int
    let link: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case questionId = "question_id"
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount = "answer_count"
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case score
        case link
        case title
    }
}

//
//  FeedbackRequest.swift
//  
//
//  Created by Maksim Volkov on 14.07.2022.
//

import Vapor

struct FeedbackRequest: Content {
    var id_user: Int
    var item: String
    var feedback: String
}

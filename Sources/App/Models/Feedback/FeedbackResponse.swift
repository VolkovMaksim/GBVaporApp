//
//  FeedbackResponse.swift
//  
//
//  Created by Maksim Volkov on 14.07.2022.
//

import Vapor

struct FeedbackResponse: Content {
    var result: Int
    var merch_message: String
    var error_message: String?
}

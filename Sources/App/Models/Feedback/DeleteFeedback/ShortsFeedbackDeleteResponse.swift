//
//  FeedbackDeleteResponse.swift
//  
//
//  Created by Maksim Volkov on 20.07.2022.
//

import Vapor

struct FeedbackDeleteResponse: Content {
    var result: Int
    var merch_message: String
    var error_message: String?
}

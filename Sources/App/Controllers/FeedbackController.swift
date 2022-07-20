//
//  FeedbackController.swift
//  
//
//  Created by Maksim Volkov on 14.07.2022.
//

import Vapor

class FeedbackController {
    func getMerch(_ req: Request) throws -> EventLoopFuture<FeedbackResponse> {
        guard let body = try? req.content.decode(MerchRequest.self) else {
            throw Abort(.badRequest)
            
        }

        print(body)

        let response = MerchResponse(
            result: 1,
            user_message: "Вот тебе инфа по товару!",
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
}

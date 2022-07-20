//
//  FeedbackController.swift
//  
//
//  Created by Maksim Volkov on 14.07.2022.
//

import Vapor

class FeedbackController {
    let shorts = Shorts()
    func postFeedback(_ req: Request) throws -> EventLoopFuture<FeedbackResponse> {
        guard let body = try? req.content.decode(FeedbackRequest.self) else {
            throw Abort(.badRequest)
            
        }

        shorts.feedback?.append(body.feedback)
//        print(shorts.feedback)
//        print(body)

        let response = FeedbackResponse(
            result: 1,
            merch_message: "Отзыв успешно добавлен!",
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
    
    func shortsFeedback() -> [String] {
        return shorts.feedback!
    }
    
    func shortsFeedbackDelete(_ req: Request) throws -> EventLoopFuture<ShortsFeedbackDeleteResponse> {
        guard let body = try? req.content.decode(ShortsFeedbackDeleteRequest.self) else {
            throw Abort(.badRequest)
            
        }

        shorts.feedback?.remove(at: body.numbOfFeed - 1)
//        print(shorts.feedback)
        print(body)

        let response = ShortsFeedbackDeleteResponse(
            result: 1,
            merch_message: "Отзыв успешно удален!",
            error_message: nil
        )

        return req.eventLoop.future(response)
    }
}

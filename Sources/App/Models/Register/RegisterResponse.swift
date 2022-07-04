//
//  RegisterResponse.swift
//  
//
//  Created by Maksim Volkov on 02.07.2022.
//

import Vapor

struct RegisterResponse: Content {
    var result: Int
    var user_message: String?
    var error_message: String?
}

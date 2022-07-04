//
//  RegisterRequest.swift
//  
//
//  Created by Maksim Volkov on 02.07.2022.
//

import Vapor

struct RegisterRequest: Content {
    var id_user: Int
    var username: String
    var password: String
    var email: String
    var gender: String
    var credit_card: String
    var bio: String
}
/*
 {
     "id_user": 123,
     "username": "admin",
     "password": "1234Qwer",
     "email": "admin@mail.ru",
     "gender": "мужик",
     "credit_card": "9321-8432-7543-6321"
     "bio": "Live man"
 }
 */

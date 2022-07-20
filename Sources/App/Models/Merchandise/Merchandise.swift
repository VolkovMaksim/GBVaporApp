//
//  Merchandise.swift
//  
//
//  Created by Maksim Volkov on 08.07.2022.
//

import Foundation

protocol Merchandise {
    var name: String { get }
    var size: Int { get }
    var quantity: Int { get }
    var price: Double { get }
    var feedback: [String]? { get }
}

class Merch {
    var merchList: [Merchandise] = [Polo(), Shorts()]
}

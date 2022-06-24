//
//  Activities.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 23/06/22.
//

import Foundation

struct Activities :  Codable {
    let activity: String?
    let type: String?
    let participants: Int?
    let price: Double?
    let link: String?
    let key: String
    let acessibility: Double
}



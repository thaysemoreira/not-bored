//
//  Content.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 23/06/22.
//

final class Content {
    
    static let shared = Content()
    private init() {}
    
    func receivedData() -> [Activities] {
        [Activities(title: "Learn More", participants: 1, price: 2.2), Activities(title: "Take a bubble bath", participants: 2, price: 3.40)]
    }
}

//
//  ActivitiesModel.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 21/06/22.
//

import Foundation

struct Categories {
    let cell : Int!
    let title: String
 //   let activities: [ActivitiesBored]
}

private let data: [Categories] = [
    Categories(cell: 1, title:"Education"),
    Categories(cell: 2, title:"Recreation")
   /* Categories(title:"Social"),
    Categories(title:"Diy"),
    Categories(title:"Charity"),
    Categories(title:"Cooking"),
    Categories(title:"Cooking"),
    Categories(title:"Relaxation"),
    Categories(title:"Music"),
    Categories(title:"Busywork")*/
]
/*
struct ActivitiesBored: Codable {
    let participants: String
    let prices: String
    
}

private let data: [Categories] = [
    Categories(title:"Education", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Recreation", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Social", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Diy", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Charity", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Cooking", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Cooking", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Relaxation", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Music", activities: [ActivitiesBored(participants: "participants", prices: "prices")]),
    Categories(title:"Busywork", activities: [ActivitiesBored(participants: "participants", prices: "prices")])
]
*/

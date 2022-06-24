//
//  SuggestionsActivities.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 24/06/22.
//

import Foundation

final class SuggestionsActivities {
    
    var activities = [Activities]()
    
    static let shared = SuggestionsActivities()
    private init() {}
    
    func makeRequest(){
        let fileUrl = Bundle.main.url(forResource: "suggestions.json", withExtension: nil)
        
        let jsonData = try! Data(contentsOf: fileUrl!)
        
        do{
            self.activities = try JSONDecoder().decode([Activities].self, from: jsonData)
            print("sucess: \(activities)")
        }catch let error {
            print("error: \(error.localizedDescription)")
        }
    }
    
}

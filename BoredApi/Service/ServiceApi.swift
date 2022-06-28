//
//  ServiceApi.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 24/06/22.
//

import Foundation

enum SystemErrors {
    case url
    case taskError(error: Error)
    case noResponse
    case noDate
    case responseStatusCode(code: Int)
    case invalidJson
}

class ServiceApi {
    
    private static let basePath = "http://www.boredapi.com/api/activity/"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.httpMaximumConnectionsPerHost = 6
        return config
    }()
    
    private static let session =  URLSession(configuration: configuration)
    
    class func loadRandom(onComplete: @escaping (Activities) -> Void, onError: @escaping (SystemErrors) -> Void) {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return      
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        return
                    }
                    do{
                        let activities = try JSONDecoder().decode(Activities.self, from: data)
                        onComplete(activities)
                        
                    } catch {
                        onError(.invalidJson)
                    }
                }else{
                    onError(.responseStatusCode(code: response.statusCode))
                }
                
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
    class func loadActivities(type: String, onComplete: @escaping (Activities) -> Void, onError: @escaping (SystemErrors) -> Void) {
        
        guard let urlActivity = URL(string: "\(basePath)?type=\(type)") else {
            onError(.url)
            return
        }
        
        let dataTask = session.dataTask(with: urlActivity) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        return
                    }
                    do{
                        let activities = try JSONDecoder().decode(Activities.self, from: data)
                        onComplete(activities)
                        
                    } catch {
                        onError(.invalidJson)
                    }
                }else{
                    onError(.responseStatusCode(code: response.statusCode))
                }
                
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
}

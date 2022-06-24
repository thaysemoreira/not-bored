//
//  SceneDelegate.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 17/06/22.
//

import UIKit
import Alamofire

struct ActivityResponse: Codable {
    
   /* enum CodingKeys: String, CodingKeys {
        case activities = "activ
    }*/
    let activities: [Activities]
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
        
         AF.request("http://www.boredapi.com/api/activity?minaccessibility=0&maxaccessibility=0.1")
              .responseDecodable(of: Activities.self) { data in
                  switch data.result {
                  case .success(let activitiesResponse):
                      print(activitiesResponse)
                  case .failure(let error):
                      print(error)
                  }
          }
          
        
/*        let url = URL(string: "http://www.boredapi.com/api/activity?minaccessibility=0&maxaccessibility=0.1")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
            print(response)
            print(error)
            print(String(data: data!, encoding: .utf8))
            
            do{
                let response = try JSONDecoder().decode(ActivityResponse.self, from: data!)
                print(response)
            } catch {
                print(error)
            }
        }
        task.resume()*/
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


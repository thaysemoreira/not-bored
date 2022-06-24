//
//  SuggestionViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 23/06/22.
//

import UIKit

class SuggestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var activities: [Activities] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRequest()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SuggestionTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuggestionTableViewCell
        cell.participantsLabel.text = activities[indexPath.row].type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
}


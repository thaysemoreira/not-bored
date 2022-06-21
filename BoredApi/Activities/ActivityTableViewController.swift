//
//  ActivitiesTableViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 21/06/22.
//

import UIKit

struct Activity {
    let cell : Int!
    let title: String
 //   let activities: [ActivitiesBored]
}

class ActivityTableViewController: UITableViewController {
    
    var activities: [Activity] = []
    
    private let tableview: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        
        activities = [Activity(cell: 1, title:"Education")]
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        /* cell.textLabel?.text = activities[indexPath.row].title
         return cell*/
        let cellActivities = Bundle.main.loadNibNamed("ActivitiesTableViewCell", owner: self)?.first as! ActivitiesTableViewCell
        
        cellActivities.activitiesLabel.text = activities[indexPath.row].title
        
        return cell
        
    }
}

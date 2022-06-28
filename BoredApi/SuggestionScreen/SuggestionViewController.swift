//
//  SuggestionViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 24/06/22.
//

import UIKit

class SuggestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var closeButton: UIButton!
    @IBOutlet weak private var activitiesLabel: UILabel!
    @IBOutlet weak private var tableViewCell: UITableView!
    @IBOutlet weak private var tryAgainButton: UIButton!
    
    var activities: [Activities] = []
    var selectedActivity: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        navigationItem.hidesBackButton = true
        
        tableViewCell.register(UINib(nibName: "SuggestionTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedActivity = self.selectedActivity {
            ServiceApi.loadActivities(type: selectedActivity.lowercased(), onComplete: { (activities) in
                
                self.activities = [activities]
                
                print(self.activities)
                
                DispatchQueue.main.async {
                    self.tableViewCell.reloadData()
                }
                
            }) { (error) in
                print(error)
            }
            
        } else {
            ServiceApi.loadRandom(onComplete: { (activities) in
                
                self.activities = [activities]
                
                DispatchQueue.main.async {
                    self.tableViewCell.reloadData()
                }
                
            }) { (error) in
                print(error)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuggestionTableViewCell
        typeLabel.text = activities[indexPath.row].type.uppercased()
        activitiesLabel.text = activities[indexPath.row].activity
        cell.participantsLabel?.text = "Particpantes \(activities[indexPath.row].participants)"
        
        if activities[indexPath.row].price == 0 {
            cell.priceLabel?.text = "Free"
        }else if activities[indexPath.row].price > 0 && activities[indexPath.row].price <= 0.3 {
            cell.priceLabel?.text = "Low"
        }else if activities[indexPath.row].price > 0.3 && activities[indexPath.row].price <= 0.6 {
            cell.priceLabel?.text = "Medium"
        }else if activities[indexPath.row].price > 0.6 {
            cell.priceLabel?.text = "High"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    @IBAction private func goToActivities(_ sender: UIButton) {
        let activtiesView = ActivitiesViewController(nibName: "ActivitiesViewController", bundle: nil)
        activtiesView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(activtiesView, animated: true)
    }
    
    @IBAction private func tryAgain(_ sender: UIButton) {
        
    }
    
}

//
//  SuggestionViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 23/06/22.
//

import UIKit

class RandomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewCell: UITableView!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var tryAnotherButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    var activities: [Activities] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        navigationItem.hidesBackButton = true
        
        tableViewCell.register(UINib(nibName: "RandomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ServiceApi.loadRandom(onComplete: { (activities) in
            
            self.activities = [activities]
            
            DispatchQueue.main.async {
                self.tableViewCell.reloadData()
            }
            
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RandomTableViewCell
        self.activityLabel.text = activities[indexPath.row].activity
        cell.participantsRandomLabel?.text = "Participantes  \(activities[indexPath.row].participants)"
        cell.typeLabel!.text = activities[indexPath.row].type
        
        if activities[indexPath.row].price == 0 {
            cell.priceRandomLabel?.text = "Free"
        }else if activities[indexPath.row].price > 0 && activities[indexPath.row].price <= 0.3 {
            cell.priceRandomLabel?.text = "Low"
        }else if activities[indexPath.row].price > 0.3 && activities[indexPath.row].price <= 0.6 {
            cell.priceRandomLabel?.text = "Medium"
        }else if activities[indexPath.row].price > 0.6 {
            cell.priceRandomLabel?.text = "High"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func closeView(_ sender: UIButton) {
        let activtiesView = ActivitiesViewController(nibName: "ActivitiesViewController", bundle: nil)
        activtiesView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(activtiesView, animated: true)
    }
    
    @IBAction func tryAnother(_ sender: Any) {
        viewWillAppear(true)
    }

}

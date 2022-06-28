//
//  ActivitiesViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 21/06/22.
//

import UIKit
import Alamofire

class ActivitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableViewCell: UITableView!
    @IBOutlet weak var buttonTest: UIButton!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    var typesActivities = ["Education", "Recreational", "Social", "Diy", "Charity", "Cooking", "Music", "Busywork"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        tableViewCell.separatorStyle = .none
        tableViewCell.register(UINib(nibName: "ActivitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.navigationItem.hidesBackButton = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typesActivities.count
    }
    
    // MARK: Configuração TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ActivitiesTableViewCell
        cell?.titleLabel.text = self.typesActivities[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let suggestionViewController = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        suggestionViewController.selectedActivity = typesActivities[indexPath.row]
        self.navigationController?.pushViewController(suggestionViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: Configuração TableViewCell
    @IBAction func goToSuggestionScreen(_ sender: UIButton) {
        let suggestionView = RandomViewController(nibName: "RandomViewController", bundle: nil)
        suggestionView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(suggestionView, animated: true)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        let HomeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
        HomeView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(HomeView, animated: true)
    }
}

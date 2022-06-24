//
//  ActivitiesViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 21/06/22.
//

import UIKit

class ActivitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableViewCell: UITableView!
    @IBOutlet weak var buttonTest: UIButton!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    var activities = ["Education", "Recreational", "Social", "Diy", "Charity", "Cooking", "Music", "Busywork"]
    
    var suggestion: [Activities] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        tableViewCell.separatorColor = .black
        
        makeRequest()
        
        tableViewCell.register(UINib(nibName: "ActivitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func makeRequest() {
        let fileUrl = Bundle.main.url(forResource: "suggestions", withExtension: "json")
        
        let jsonData = try! Data(contentsOf: fileUrl!)
            
            do{
                self.suggestion = try JSONDecoder().decode([Activities].self, from: jsonData)
                print("sucess: \(self.suggestion)")
            }catch let error {
                print("error: \(error.localizedDescription)")
            }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    // MARK: Configuração TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ActivitiesTableViewCell
        cell?.titleLabel.text = self.activities[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @IBAction func goToSuggestionScreen(_ sender: UIButton) {
        let suggestion = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        
        present(suggestion, animated: true)
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
extension ActivitiesViewController: TableViewNew {
    func onClickCell(index: Int) {
        print("\(activities[index]) is Clicked")

    }
}



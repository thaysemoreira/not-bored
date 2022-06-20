//
//  TermsViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 20/06/22.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func closeAction(_ sender: AnyObject) {
        dismiss(animated: true)
        
    }
    
}

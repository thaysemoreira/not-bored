//
//  TermsViewController.swift
//  BoredApi
//
//  Created by Thayse Bianca Amaral De Carvalho Moreira on 20/06/22.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var scrollViewTerms: UIScrollView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var termsTextView: UITextView!
    @IBOutlet weak var stackViewTerms: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
}

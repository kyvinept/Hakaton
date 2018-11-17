//
//  ViewController.swift
//  Hakaton
//
//  Created by Silchenko on 17.11.2018.
//  Copyright © 2018 Silchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        let VControl = UIStoryboard.init(name: "First",
                                         bundle: nil ).instantiateViewController(
                                            withIdentifier: "FirstViewController")
        self.navigationController?.pushViewController(VControl, animated: false)
    }
    @IBAction func buttonAction(_ sender: Any) {

        
    }
}


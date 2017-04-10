//
//  IPInfoViewController.swift
//  Assignment3
//
//  Created by  on 3/30/17.
//  Copyright © 2017 UHCl. All rights reserved.
//

import UIKit

class IPInfoViewController: UIViewController {

    
    @IBOutlet weak var clase: UITextField!
    @IBOutlet weak var ipaddress: UITextField!
    
    var address: String!
    var cl: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ipaddress.text = address
        clase.text = cl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

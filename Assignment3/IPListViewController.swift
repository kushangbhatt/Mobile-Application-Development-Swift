//
//  IPListViewController.swift
//  Assignment3
//
//  Created by  on 3/30/17.
//  Copyright © 2017 UHCl. All rights reserved.
//

import UIKit

class IPListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet var tableView: UITableView!
    
    var firstIP: String!
    var lastIP: String!
    var l:listOfIp!
    var list:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        l = listOfIp(firstip: firstIP,lastip: lastIP)
        list = l.showlist()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return l.count()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellidentifier = "list"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath)
        let s = list[indexPath.row]
        cell.textLabel?.text = s
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            if let r = segue.destination as? IPInfoViewController{
                let selectedrow = self.tableView.indexPathForSelectedRow?.row
                r.address = list[selectedrow!]
                let selectedIP =  list[selectedrow!].components(separatedBy: ".")
                
                if Int(selectedIP[0])! >= 0 && Int(selectedIP[0])! < 128   {
                    
                    r.cl = "A"
                    
                } else if Int(selectedIP[0])! >= 128 && Int(selectedIP[0])! < 192   {
                    
                    r.cl = "B"
                    
                } else if Int(selectedIP[0])! >= 192 && Int(selectedIP[0])! < 224   {
                    
                    r.cl = "C"
                    
                } else if Int(selectedIP[0])! >= 224 && Int(selectedIP[0])! < 239   {
                    
                    r.cl = "D"
                    
                } else {
                    
                    r.cl = "E"
                    
                }
                
            
            }
        }
    }

}

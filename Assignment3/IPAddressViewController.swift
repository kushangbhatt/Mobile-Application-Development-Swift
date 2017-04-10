//
//  ViewController.swift
//  Assignment3
//
//  Created by  on 3/30/17.
//  Copyright © 2017 UHCl. All rights reserved.
//

import UIKit

class IPAddressViewController: UIViewController, UITextFieldDelegate {
    
    var v: FLIP!
    
    
    @IBOutlet weak var first: UITextField!
    
    @IBOutlet weak var second: UITextField!
    
    @IBOutlet weak var third: UITextField!
    
    @IBOutlet weak var fourth: UITextField!
    
    @IBOutlet weak var bit: UITextField!
    
    @IBOutlet weak var ShowButton: UIButton!
    
    
    
    @IBAction func Result(_ sender: UIButton) {
        
        let f = Int(first.text!)!
        let s = Int(second.text!)!
        let t = Int(third.text!)!
        let fo = Int(fourth.text!)!
        let b = Int(bit.text!)!
        
        
        
        let alert = UIAlertController(title: "First and Last IP Addresses", message:"First IP \(v.FirstIP(f, s, t, fo, b)) \n Last Ip \(v.LastIP(f, s, t, fo, b)) \n SubnetMask \(v.subnetmask(b))", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title:"Close",style:.default, handler: { _ in}))
        self.present(alert,animated: true, completion: {})
    }
    
    


    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

        switch textField.tag {
        case 1:
            if first.text! == "" {
                return true
            }
            if Int(first.text!)! < 0 || Int(first.text!)! > 255 {
                let alert = UIAlertController(title: "ERROR1", message:"Invalid Input", preferredStyle:.alert)
                alert.addAction(UIAlertAction(title:"Close",style:.default, handler: { _ in}))
                self.present(alert,animated: true, completion: {})
            }
            break
        case 2:
            if second.text! == "" {
                return true
            }
            if Int(second.text!)! < 0 || Int(second.text!)! > 255 {
                let alert = UIAlertController(title: "ERROR2", message:"Invalid Input", preferredStyle:.alert)
                alert.addAction(UIAlertAction(title:"Close",style:.default, handler: { _ in}))
                self.present(alert,animated: true, completion: {})
            }
            break
        case 3:
            if third.text! == "" {
                return true
            }
            if Int(third.text!)! > 255 {
                let alert = UIAlertController(title: "ERROR3", message:"Invalid Input", preferredStyle:.alert)
                alert.addAction(UIAlertAction(title:"Close",style:.default, handler: { _ in}))
                self.present(alert,animated: true, completion: {})
            }
            break
        case 4:
            if fourth.text! == "" {
                return true
            }
            if Int(fourth.text!)! > 255 {
                let alert = UIAlertController(title: "ERROR4", message:"Invalid Input", preferredStyle:.alert)
                alert.addAction(UIAlertAction(title:"Close",style:.default, handler: { _ in}))
                self.present(alert,animated: true, completion: {})
            }
            break
        case 5:
            if bit.text! == "" {
                return true
            }
            if Int(bit.text!)! < 1 ||  Int(bit.text!)! > 32  {
                let alert = UIAlertController(title: "ERROR5", message:"Invalid Input", preferredStyle:.alert)
                alert.addAction(UIAlertAction(title:"Close",style:.default, handler: { _ in}))
                self.present(alert,animated: true, completion: {})
            }
            break

        default:
            break
        }
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedcharacter = CharacterSet.decimalDigits
        let charset = CharacterSet(charactersIn: string)
        ShowButton.isEnabled = true
        return allowedcharacter.isSuperset(of: charset)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let iplist = segue.destination as? IPListViewController{
            
            let f = Int(first.text!)!
            let s = Int(second.text!)!
            let t = Int(third.text!)!
            let fo = Int(fourth.text!)!
            let b = Int(bit.text!)!
            
            let fip = v.FirstIP(f, s, t, fo, b)
            let lip = v.LastIP(f, s, t, fo, b)
            iplist.firstIP = fip
            iplist.lastIP = lip
            
        }
    }
    
    @IBAction func modifyandnew(segue: UIStoryboardSegue){
        if segue.identifier == "New"{
            first.text = ""
            second.text = ""
            third.text = ""
            fourth.text = ""
            bit.text = ""
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        ShowButton.isEnabled = false
        first.delegate = self
        second.delegate = self
        third.delegate = self
        fourth.delegate = self
        first.tag = 1
        second.tag = 2
        third.tag = 3
        fourth.tag = 4
        bit.tag = 5
        bit.delegate = self
        v = FLIP()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


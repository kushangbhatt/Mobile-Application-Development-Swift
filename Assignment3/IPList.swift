//
//  IPList.swift
//  Assignment3
//
//  Created by  on 4/6/17.
//  Copyright © 2017 UHCl. All rights reserved.
//

import Foundation


class listOfIp{
    var iplist: Array<String>
    var firstip = ""
    var lastip = ""
    
    init(firstip: String, lastip: String) {
        iplist = Array<String>()
        self.firstip = firstip
        self.lastip = lastip
        
    }
    
    func showlist() -> Array<String>{
        let f = firstip.components(separatedBy: ".")
        let l = lastip.components(separatedBy: ".")
        var c = 0
        for i in Int(f[2])! ... Int(l[2])! {
            for j in Int(f[3])! ... Int(l[3])!{
                let ips = f[0] + "." + f[1] + "." + String(i) + "." + String(j)
                iplist.insert(ips, at: c)
                c += 1
            }
        }
        
        return iplist
    }
    
    func count() -> Int {
        return iplist.count
    }
    
    
}

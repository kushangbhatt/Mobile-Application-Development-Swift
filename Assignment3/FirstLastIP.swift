//
//  FirstLastIP.swift
//  Assignment3
//
//  Created by  on 3/30/17.
//  Copyright © 2017 UHCl. All rights reserved.
//

import Foundation

class FLIP{
    var first:Int
    var second:Int
    var third:Int
    var fourth:Int
    var bit:Int
    
    
    init() {
        first = 0
        second = 0
        third = 0
        fourth = 0
        bit = 0
    }
    
    
    func FirstIP(_ first:Int, _ second:Int, _ third:Int, _ fourth:Int, _ bit:Int) -> String {
        
        var FIP:String = ""
        
        var binstring = String(repeating: "1", count:bit)
        let zeros = 32 - bit
        binstring = binstring + String(repeating: "0", count: zeros)
        let loc1 = binstring.index(binstring.startIndex, offsetBy: 8)
        let oct1 = binstring[binstring.startIndex ..< loc1]
        let dec1 = Int(oct1, radix:2)
        let loc2 = binstring.index(loc1, offsetBy: 8)
        let oct2 = binstring[loc1 ..< loc2]
        let dec2 = Int(oct2, radix:2)
        let loc3 = binstring.index(loc2, offsetBy: 8)
        let oct3 = binstring[loc2 ..< loc3]
        let dec3 = Int(oct3, radix:2)
        let loc4 = binstring.index(loc3, offsetBy: 8)
        let oct4 = binstring[loc3 ..< loc4]
        let dec4 = Int(oct4, radix:2)
        
        self.first = first & dec1!
        self.second = second & dec2!
        self.third = third & dec3!
        self.fourth = fourth & dec4!
        let IP = [self.first, self.second, self.third, self.fourth]
        FIP = IP.map{String($0)}.joined(separator:".")
        
        return FIP
    }
    
    func LastIP(_ first:Int, _ second:Int, _ third:Int, _ fourth:Int, _ bit:Int) -> String{
        
        var LIP:String = ""
        
        var binstring = String(repeating: "0", count:bit)
        let ones = 32 - bit
        binstring = binstring + String(repeating: "1", count: ones)
        let loc1 = binstring.index(binstring.startIndex, offsetBy: 8)
        let oct1 = binstring[binstring.startIndex ..< loc1]
        let dec1 = Int(oct1, radix:2)
        let loc2 = binstring.index(loc1, offsetBy: 8)
        let oct2 = binstring[loc1 ..< loc2]
        let dec2 = Int(oct2, radix:2)
        let loc3 = binstring.index(loc2, offsetBy: 8)
        let oct3 = binstring[loc2 ..< loc3]
        let dec3 = Int(oct3, radix:2)
        let loc4 = binstring.index(loc3, offsetBy: 8)
        let oct4 = binstring[loc3 ..< loc4]
        let dec4 = Int(oct4, radix:2)
        
        self.first = first | dec1!
        self.second = second | dec2!
        self.third = third | dec3!
        self.fourth = fourth | dec4!
        let IP = [self.first, self.second, self.third, self.fourth]
        LIP = IP.map{String($0)}.joined(separator:".")
        
        return LIP
    }
    
    func subnetmask(_ bit: Int) -> String {
        var smask = ""
        
        
        var binstring = String(repeating: "1", count:bit)
        let zeros = 32 - bit
        binstring = binstring + String(repeating: "0", count: zeros)
        let loc1 = binstring.index(binstring.startIndex, offsetBy: 8)
        let oct1 = binstring[binstring.startIndex ..< loc1]
        let dec1 = Int(oct1, radix:2)
        let loc2 = binstring.index(loc1, offsetBy: 8)
        let oct2 = binstring[loc1 ..< loc2]
        let dec2 = Int(oct2, radix:2)
        let loc3 = binstring.index(loc2, offsetBy: 8)
        let oct3 = binstring[loc2 ..< loc3]
        let dec3 = Int(oct3, radix:2)
        let loc4 = binstring.index(loc3, offsetBy: 8)
        let oct4 = binstring[loc3 ..< loc4]
        let dec4 = Int(oct4, radix:2)
        
        let mask = [dec1!, dec2!, dec3!, dec4!]
        smask = mask.map{String($0)}.joined(separator:".")
        return smask
    }
    
}

//
//  Die.swift
//  craps-201806110940
//
//  Created by Adland Lee on 6/11/18.
//  Copyright © 2018 Adland Lee. All rights reserved.
//

import Foundation

class Die {
    let numberOfFaces: Int
    var face: Int!
    
    init(_ numberOfFaces: Int = 6, initialFace: Int? = nil) {
        self.numberOfFaces = numberOfFaces
        
        if (initialFace == nil) || (initialFace! < 1 || initialFace! > numberOfFaces) {
            _ = self.roll()
        }
        else {
            self.face = initialFace
        }
        
    }
    
    func roll() -> Int {
        let upper = numberOfFaces
        let lower = 1
        face = Int(arc4random_uniform(UInt32(upper - lower + 1))) + lower
        return face
    }
}

extension Die: Hashable {
    static func == (lhs: Die, rhs: Die) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
}

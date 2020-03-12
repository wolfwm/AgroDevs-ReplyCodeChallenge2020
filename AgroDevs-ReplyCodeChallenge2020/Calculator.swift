//
//  Calculator.swift
//  AgroDevs-ReplyCodeChallenge2020
//
//  Created by Alex Nascimento on 12/03/20.
//  Copyright © 2020 AgroDevs. All rights reserved.
//

class Calculator {
    
    static func workPotential(r1: Replyer, r2: Replyer) -> Int {
        guard let dev1 = r1 as? Developer, let dev2 = r2 as? Developer else {
            return 0
        }
        let common = dev1.skills.union(dev2.skills).count
        let distinct = dev1.skills.intersection(dev2.skills).count
        return common * distinct
    }
    
    static func bonusPotential(r1: Replyer, r2: Replyer) -> Int {
        if r1.company != r2.company {
            return 0
        }
        return r1.bonus * r2.bonus
    }
    
    static func totalPotential(r1: Replyer, r2: Replyer) -> Int {
        return workPotential(r1: r1, r2: r2) + bonusPotential(r1: r1, r2: r2)
    }
}

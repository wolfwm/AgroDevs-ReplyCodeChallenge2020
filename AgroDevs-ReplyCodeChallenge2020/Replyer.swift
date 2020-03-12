//
//  Replyer.swift
//  AgroDevs-ReplyCodeChallenge2020
//
//  Created by Alex Nascimento on 12/03/20.
//  Copyright © 2020 AgroDevs. All rights reserved.
//

class Replyer {
    let company: String
    let bonus: Int
    var coord: Coord?
    
    init(company: String, bonus: Int) {
        self.company = company
        self.bonus = bonus
    }
}

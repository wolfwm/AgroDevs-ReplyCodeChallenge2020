//
//  Developer.swift
//  AgroDevs-ReplyCodeChallenge2020
//
//  Created by Alex Nascimento on 12/03/20.
//  Copyright © 2020 AgroDevs. All rights reserved.
//

class Developer: Replyer {
    
    let nSkills: Int
    let skills: Set<String>
    init(company: String, bonus: Int, nSkills: Int, skills: Set<String>) {
        self.skills = skills
        self.nSkills = nSkills
        super.init(company: company, bonus: bonus)
    }
}

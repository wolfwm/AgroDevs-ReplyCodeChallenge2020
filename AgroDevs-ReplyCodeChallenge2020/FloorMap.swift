//
//  FloorMap.swift
//  AgroDevs-ReplyCodeChallenge2020
//
//  Created by Alex Nascimento on 12/03/20.
//  Copyright © 2020 AgroDevs. All rights reserved.
//

class FloorMap {
    var matrix = [[Character]]()
    var developers = [Developer]()
    var managers = [Manager]()
    
    init(matrix: [[Character]], devList: [Developer], managerList: [Manager]) {
        self.matrix = matrix
        self.developers = devList
        self.managers = managerList
    }
}

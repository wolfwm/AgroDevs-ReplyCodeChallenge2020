//
//  Desk.swift
//  AgroDevs-ReplyCodeChallenge2020
//
//  Created by Wolfgang Walder on 12/03/20.
//  Copyright © 2020 AgroDevs. All rights reserved.
//

class Desk {
    let deskType: Character
    let numNeighborUnavailble: Int
    let numNeighborDeveloperDesk: Int
    let numNeighborManagerDesk: Int
    let coord: Coord
    
    init(deskType: Character, numNeighUnavailble: Int, numNeighDeveloperDes: Int, numNeighManagerDesk: Int, coord: Coord) {
        self.deskType = deskType
        self.numNeighborUnavailble = numNeighUnavailble
        self.numNeighborDeveloperDesk = numNeighDeveloperDes
        self.numNeighborManagerDesk = numNeighManagerDesk
        self.coord = coord
    }
}

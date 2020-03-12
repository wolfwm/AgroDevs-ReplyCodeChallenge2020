//
//  FloorMap.swift
//  AgroDevs-ReplyCodeChallenge2020
//
//  Created by Alex Nascimento on 12/03/20.
//  Copyright © 2020 AgroDevs. All rights reserved.
//

class FloorMap {
    var deskMatrix = [[Desk]]()
    var developers = [Developer]()
    var managers = [Manager]()
    
    init(matrix: [[Character]], devList: [Developer], managerList: [Manager]) {
        
        var numNeighborUnavailble = 0
        var numNeighborDeveloperDesk = 0
        var numNeighborManagerDesk = 0
        
        for i in (0..<matrix.count) {
            for j in (0..<matrix[i].count) {
                if let up = matrix[i+1][j] as Character? {
                    switch up {
                    case "#":
                        numNeighborUnavailble += 1
                    case "_":
                        numNeighborDeveloperDesk += 1
                    case "M":
                        numNeighborManagerDesk += 1
                    default:
                        return
                    }
                }
                
                if let up = matrix[i-1][j] as Character? {
                    switch up {
                    case "#":
                        numNeighborUnavailble += 1
                    case "_":
                        numNeighborDeveloperDesk += 1
                    case "M":
                        numNeighborManagerDesk += 1
                    default:
                        return
                    }
                }
                
                if let up = matrix[i][j+1] as Character? {
                    switch up {
                    case "#":
                        numNeighborUnavailble += 1
                    case "_":
                        numNeighborDeveloperDesk += 1
                    case "M":
                        numNeighborManagerDesk += 1
                    default:
                        return
                    }
                }
                
                if let up = matrix[i][j-1] as Character? {
                    switch up {
                    case "#":
                        numNeighborUnavailble += 1
                    case "_":
                        numNeighborDeveloperDesk += 1
                    case "M":
                        numNeighborManagerDesk += 1
                    default:
                        return
                    }
                }
                
                self.deskMatrix[i][j] = Desk(deskType: matrix[i][j], numNeighUnavailble: numNeighborUnavailble, numNeighDeveloperDes: numNeighborDeveloperDesk, numNeighManagerDesk: numNeighborManagerDesk, coord: Coord(x: i, y: j))
            }
        }
        self.developers = devList
        self.managers = managerList
    }
}

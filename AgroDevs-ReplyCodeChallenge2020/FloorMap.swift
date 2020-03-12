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
            deskMatrix.append([])
            for j in (0..<matrix[i].count) {
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
                
                if let down = matrix[i][j+1] as Character? {
                    switch down {
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
                
                if let right = matrix[i+1][j] as Character? {
                    switch right {
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
                
                if let left = matrix[i-1][j] as Character? {
                    switch left {
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
                
                self.deskMatrix[i].append(Desk(deskType: matrix[i][j], numNeighUnavailble: numNeighborUnavailble, numNeighDeveloperDes: numNeighborDeveloperDesk, numNeighManagerDesk: numNeighborManagerDesk, coord: Coord(x: i, y: j)))
            }
        }
        self.developers = devList
        self.managers = managerList
    }
    
    func populateOffice() -> [[Replyer]] {
        var replyerMatrix = [[Replyer]]()
        
        for deskRow in (0..<deskMatrix.count) {
            replyerMatrix.append([])
            for cell in (0..<deskMatrix[deskRow].count) {
                replyerMatrix[cell].append(Replyer(company: "placeholder", bonus: 0))
            }
        }
        
        var placed: Bool = false
        
        for dev in developers {
            placed = false
            for i in (0..<deskMatrix.count) {
                for j in (0..<deskMatrix[i].count) {
                    if deskMatrix[i][j].deskType == "_" {
                        dev.coord = deskMatrix[i][j].coord
                        replyerMatrix[i][j] = dev
                        placed = true
                        break
                    }
                }
                if placed {
                    break
                }
            }
        }
        
        for manager in managers {
            placed = false
            for i in (0..<deskMatrix.count) {
                for j in (0..<deskMatrix[i].count) {
                    if deskMatrix[i][j].deskType == "M" {
                        manager.coord = deskMatrix[i][j].coord
                        replyerMatrix[i][j] = manager
                        placed = true
                        break
                    }
                }
                if placed {
                    break
                }
            }
        }
        
        return replyerMatrix
    }
    
    func calcScore(replyerMatrix: [[Replyer]]) -> Int {
        var thisReplyer = Replyer(company: "placeholder", bonus: 0)
        var wp = 0
        var bp = 0
        var tp = 0
        var score = 0
        
        for i in (0..<replyerMatrix.count) {
            for j in (0..<replyerMatrix[i].count) {
                thisReplyer = replyerMatrix[i][j]
                
                if let right = replyerMatrix[i][j+1] as Replyer? {
                    wp = 0
                    if let thisDeveloper = thisReplyer as? Developer, let rightDeveloper = right as? Developer {
                        wp = thisDeveloper.skills.intersection(rightDeveloper.skills).count * (thisDeveloper.skills.union(rightDeveloper.skills).count - thisDeveloper.skills.intersection(rightDeveloper.skills).count)
                    }
                    bp = thisReplyer.bonus * right.bonus
                    tp = wp + bp
                    score += tp
                }
                
                if let down = replyerMatrix[i+1][j] as Replyer? {
                    wp = 0
                    if let thisDeveloper = thisReplyer as? Developer, let downDeveloper = down as? Developer {
                        wp = thisDeveloper.skills.intersection(downDeveloper.skills).count * (thisDeveloper.skills.union(downDeveloper.skills).count - thisDeveloper.skills.intersection(downDeveloper.skills).count)
                    }
                    bp = thisReplyer.bonus * down.bonus
                    tp = wp + bp
                    score += tp
                }
            }
        }
        
        return score
    }
}

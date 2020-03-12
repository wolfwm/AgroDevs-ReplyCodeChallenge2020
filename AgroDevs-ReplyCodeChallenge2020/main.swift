//
//  main.swift
//  AgroDevs-ReplyCodeChallenge2020
//
//  Created by Wolfgang Walder on 12/03/20.
//  Copyright © 2020 AgroDevs. All rights reserved.
//

import ArgumentParser

struct ReplyChallenge: ParsableCommand {
    
    @Argument() var fileURL: String

    func run() throws {
        print(fileURL + " deu certo.")
    }
}

ReplyChallenge.main()

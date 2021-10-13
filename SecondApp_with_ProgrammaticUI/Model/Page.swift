//
//  Page.swift
//  SecondApp_with_ProgrammaticUI
//
//  Created by Fuad Rustamov on 13.10.21.
//

import Foundation

struct Page {
    let imageName: String
    let headerText: String
    let bodyText: String
}

let pages = [
    Page(imageName: "nikeLogo", headerText: "Just do it.", bodyText: "The tenacity of athletes and their spirit of pushing through adversity will win out in the end, and a global pandemic won't stop sports."),
    Page(imageName: "pumaImage", headerText: "Forever Faster.", bodyText: "PUMA always looks to do better - we are Forever Faster."),
    Page(imageName: "adidasImage", headerText: "All you need to know.", bodyText: "Determined to help athletes achieve all their goals, even the ones that seem impossible to start with.")
]

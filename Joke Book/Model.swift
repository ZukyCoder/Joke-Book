//
//  Model.swift
//  Joke Book
//
//  Created by Developer on 23/02/2021.
//

import Foundation
import UIKit

struct jokesModel: Codable {
    let id: Int
    let type: TypeEnum
    let setup, punchline: String
}

enum TypeEnum: String, Codable {
    case general = "general"
    case knock = "knock-knock"
    case programming = "programming"
}


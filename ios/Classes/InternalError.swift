//
//  InternalError.swift
//  appHud
//
//  Created by Stanislav on 09.03.2021.
//

import Foundation

struct InternalError: Error {
    let code: String
    var message: String?
}

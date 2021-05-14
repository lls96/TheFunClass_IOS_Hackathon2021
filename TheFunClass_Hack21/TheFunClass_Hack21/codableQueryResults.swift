//
//  Class.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/2/21.
//
import UIKit
struct codeableQueryResults: Codable {
    var subject: String
    var code: Int
}
struct ClassResponseTwo: Codable {
    let success: Bool
    let data: [codeableQueryResults]
}


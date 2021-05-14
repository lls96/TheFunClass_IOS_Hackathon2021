//
//  Class.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/2/21.
//
import UIKit
struct Class: Codable {
    var id:Int
    var subject: String
    var code: Int
    var name: String
    var description: String
    var credit_count: String
    var CU_Reviews_Overall: Float
    var CU_Reviews_Difficulty: Float
    var CU_Reviews_Workload: Float

}

struct ClassResponse: Codable {
    let success: Bool
    let data: Class
}
extension Class: Equatable{
    static func ==(lhs: Class, rhs: Class) -> Bool {
        return lhs.name == rhs.name && lhs.code == rhs.code
    }
}

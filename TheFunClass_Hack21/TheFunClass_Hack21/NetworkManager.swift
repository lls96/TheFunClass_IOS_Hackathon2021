//
//  NetworkManager.swift
//  TheFunClass_Hack21
//
//  Created by Lauren Simons on 5/1/21.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let host = "http://fun-class-backend.herokuapp.com/api/courses/"

//    INSERT FUNCTIONS HERE
    
//query function
    static func getSearchClasses(query: String, completion: @escaping ([codeableQueryResults]) -> Void) {
        let endpoint = "\(host)search/\(query)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let ClassResponseTwo = try?
                    jsonDecoder.decode(ClassResponseTwo.self, from: data) {
                    completion(ClassResponseTwo.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
//get specific class details
    static func getSpecificClass(subject: String, code: Int, completion: @escaping (Class) -> Void) {
        let endpoint = "\(host)\(subject)/\(code)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let ClassResponse = try?
                    jsonDecoder.decode(ClassResponse.self, from: data) {
                    completion(ClassResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

}

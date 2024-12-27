//
//  Manager.swift
//  pruebaGoNet-BBVA
//
//  Created by Ricardo Gonzalez on 27/12/24.
//

import Foundation
import Alamofire

class DataManager {
    
    /*func fetchData<T: Decodable>(responseModel: T.Type, path: String, method: HTTPMethod, parameters:[String: Any]? = nil, headers: HTTPHeaders? = nil, completionHandler: @escaping (Result<Decodable, Error>) -> Void) {
        AF.request(path, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(responseModel, from: data)
                    completionHandler(.success(response))
                }
                catch {
                    completionHandler(.failure(error))
                    print(error)
                }
                break
            case .failure(let failure):
                completionHandler(.failure(failure))
                break
            }
        }
    }*/
    
    
    func fetchData<T: Decodable>(responseModel: T.Type, path: String, method: HTTPMethod, parameters:[String: Any]? = nil, headers: HTTPHeaders? = nil, completionHandler: @escaping (Result<T, Error>) -> Void) {
        AF.request(path, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    // Decodificar la respuesta en el tipo específico T
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(response))  // Devuelves el tipo específico T
                } catch {
                    completionHandler(.failure(error))
                    print(error)
                }
            case .failure(let failure):
                completionHandler(.failure(failure))
            }
        }
    }
    
}

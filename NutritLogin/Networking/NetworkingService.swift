//
//  NetworkingService.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 25/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import Foundation
import Alamofire

struct ErrorResponse: Decodable, LocalizedError {
    let reason: String
}

enum myResult<T, E: Error> {
    case success(T)
    case failure(E)
}

enum NetworkError : String, Error {
    case parametersNil  = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL     = "URL is nil."
    case badResponse    = "Respuesta mal"
}

class NetworkingService {
    let baseURL = "http://ec2-13-57-179-97.us-west-1.compute.amazonaws.com"
    
    func request(endPoint: String,
                 parameters: [String:Any],
                 completion: @escaping (myResult<User, NetworkError>) -> Void) {
        guard let url = URL(string: baseURL + endPoint) else  {
            completion(.failure(NetworkError.missingURL))
            return
        }
        
        var request = URLRequest(url: url)
        var components = URLComponents()
        var queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: String(describing: value))
            queryItems.append(queryItem)
        }
        components.queryItems = queryItems
        //Username, password.  utf8 es una codificacion estandar para hacer solicitudes a internet
        let queryItemData = components.query?.data(using: .utf8)
        
        request.httpBody = queryItemData
        request.httpMethod = "POST"
        request.addValue("application/x-www-x-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.badResponse))
                return
            }
                print("ESTO ES MI RESPONSE: \(response.statusCode)")
                
            switch response.statusCode {
            case 200..<300 :
                print("SUCCESS")
            default:
                print("FAILURE")
            }
            
                if let unwrappedData = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                        print("ESTE ES MI JSON: \(json)")
                        
                        if let user = try? JSONDecoder().decode(User.self, from: unwrappedData) {
                            completion(.success(user))
                        }else {
                         let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
                            print("ESTE ES MI ERROR RESPONSE: \(errorResponse)")
                        }
                    } catch {
                        print("ESTE ES MI ERROR: \(error)")
                    }
                }
          }
        }
        
        task.resume()
    }
}

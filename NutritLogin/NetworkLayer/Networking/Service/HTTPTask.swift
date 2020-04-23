//
//  HTTPTask.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 22/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeaders? )
    
}

//
//  EndPointType.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 22/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var task: HTTPTask {get}
    var headers: HTTPHeaders? {get}
}

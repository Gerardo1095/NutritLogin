//
//  NetworkRouter.swift
//  NutritLogin
//
//  Created by Gerardo Mendoza Avas on 22/04/20.
//  Copyright © 2020 Gerardo Mendoza. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

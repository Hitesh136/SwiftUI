//
//  ServiceHandler.swift
//  Players
//
//  Created by Hitesh  Agarwal on 16/10/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation
import Alamofire
 
enum NetworkError: String, Error {
	case invalidURL = "URL is not Valid"
	case unknown = "unkowne"
	case sessionExpire = "The Session has Expired"
	case internalServerError = "Looks like server is not working"
	case decodingError = "Something is wrong with codable object"
}

class ServiceHandler<T: Codable> {
	
	func request(url: String,
				 method: HTTPMethod,
                 paramters: [String: Any] = [:],
                 completionHandler completion: @escaping (Swift.Result<T, NetworkError>) -> ()) {
		
		let finalPath = APIPath.baseURL.rawValue +  url
		guard let finalURL = URL(string: finalPath) else {
			completion(.failure(.invalidURL))
			return
		}
		
		CommonClass.showLoader()
		
        var _parameters = paramters
        _parameters["api_key"] = "c5b2e267c7eefe828ba2e1042749bba7"
        let alamofireRequest = Alamofire.request(finalURL,
                                        method: method,
                                        parameters: _parameters,
                                        encoding: URLEncoding.default,
                                        headers: getHeaders())
        
        if let _urlRequest = alamofireRequest.request {
            NetworkLogger.log(request: _urlRequest)
        }
        alamofireRequest.response { (response) in
		  
            CommonClass.hideLoader()
            guard let httpResponse = response.response,
                let responseData = response.data else {
                    completion(.failure(.unknown))
                    return
            }
            NetworkLogger.log(response: httpResponse)
            let statusCode = httpResponse.statusCode
            if (200...204).contains(statusCode) {
                let jsonDecoder = JSONDecoder()
                do {
                    let decodedObject = try jsonDecoder.decode(T.self, from: responseData)
                    completion(.success(decodedObject))
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(.decodingError))
                }
            } else if statusCode == 500 {
                print("Something went wrong with server")
                completion(.failure(.internalServerError))
            } else if statusCode == 401 {
                print("Session expire")
                completion(.failure(.sessionExpire))
            } else {
                print(response.error?.localizedDescription ?? "")
                completion(.failure(.unknown))
            }
		}.resume()
	}
    
    func getHeaders() -> [String: String] {
        return [:]
    }
}

 

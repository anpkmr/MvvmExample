//
//  BaseService.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import Alamofire

let kJSONParsinError = NSLocalizedString("JSON parsing error", comment: "Other")


class ClientService: NSObject {
    
    
    static let shardService = ClientService()
    
    
    func postRequest(requestUrl:URL,requestParam:[String:Any]?,completion:@escaping (Any?,Error?)->Void) {
       
        Alamofire.request(requestUrl, method:.post, parameters: requestParam, encoding: URLEncoding.default, headers: nil).validate({ request, response, data in
            print("request==\(String(describing: request))==== response==\(response)=== and finally dat======\(String(describing: data))")
            var errorMessage = ""
            if response.statusCode >= 200 && response.statusCode < 400 {
                return .success
            } else {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    if let json =  jsonResponse as? [String:Any] {
                        if let message =  json["message"] as? String {
                            errorMessage =  message
                        }else {
                            errorMessage = kJSONParsinError
                        }
                    } else {
                        errorMessage = kJSONParsinError
                    }
                    
                }
                catch let error {
                    print(error)
                    return .failure(error)
                }
            }
            return .failure(CSCustomError.myError(message:  errorMessage))
        }).responseJSON { (jsonResponse) in
            switch jsonResponse.result {
            case .success( _):
                completion(jsonResponse.result.value, nil)
                break
            case .failure(let reqError):
                completion(nil, reqError)
                break
            }
        }
    }
    
    
    
    func getRequest(requestUrl:URL,requestParam:[String:Any]?,completion:@escaping (Any?,Error?)->Void) {
        
        Alamofire.request(requestUrl, method:.get, parameters: requestParam, encoding: URLEncoding.default, headers: nil).validate({ request, response, data in
            print("request==\(String(describing: request))==== response==\(response)=== and finally dat======\(String(describing: data))")
            var errorMessage = ""
            if response.statusCode >= 200 && response.statusCode < 400 {
                return .success
            } else {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    if let json =  jsonResponse as? [String:Any] {
                        if let message =  json["message"] as? String {
                            errorMessage =  message
                        }else {
                            errorMessage = kJSONParsinError
                        }
                    } else {
                        errorMessage = kJSONParsinError
                    }
                    
                }
                catch let error {
                    print(error)
                    return .failure(error)
                }
            }
            return .failure(CSCustomError.myError(message:  errorMessage))
        }).responseJSON { (jsonResponse) in
            switch jsonResponse.result {
            case .success( _):
                completion(jsonResponse.result.value, nil)
                break
            case .failure(let reqError):
                completion(nil, reqError)
                break
            }
        }
    }
    
    func formDataRequest(fileURL:URL,requestUrl:URL,requestParam:[String:Any]?,completion:@escaping (Any?,Error?)->Void) {
        
        Alamofire.upload(fileURL, to: requestUrl, method: .put)
            .uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Upload Progress: \(progress.fractionCompleted)")
            }.downloadProgress { progress in // called on main queue by default
                print("Download Progress: \(progress.fractionCompleted)")
            }.validate({ request, response, data in
                print("request==\(String(describing: request))==== response==\(response)=== and finally dat======\(String(describing: data))")
                var errorMessage = ""
                if response.statusCode >= 200 && response.statusCode < 400 {
                    return .success
                } else {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                        if let json =  jsonResponse as? [String:Any] {
                            if let message =  json["message"] as? String {
                                errorMessage =  message
                            }else {
                                errorMessage = kJSONParsinError
                            }
                        } else {
                            errorMessage = kJSONParsinError
                        }
                    }
                    catch let error {
                        print(error)
                        return .failure(error)
                    }
                }
                return .failure(CSCustomError.myError(message:  errorMessage))
            }).responseJSON { jsonResponse in
                switch jsonResponse.result {
                case .success( _):
                    completion(jsonResponse.result.value,nil)
                    break
                case .failure(let reqError):
                    completion(nil, reqError)
                    break
                }
        }
    }
    
}

class CSCustomError:Error {
    class func myError(message:String)->Error{
        return NSError(domain: Bundle.main.bundleIdentifier!, code: 422, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
    
}

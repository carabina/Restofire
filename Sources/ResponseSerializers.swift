//
//  AnyResponseSerializerType.swift
//  Restofire
//
//  Created by Rahul Katariya on 25/04/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import Foundation
import Alamofire

class ResponseSerializers {
    
    static func JSONResponseSerializer<M>() -> ResponseSerializer<M, NSError> {
        return ResponseSerializer { _, _, data, error in
            
            guard error == nil else { return .Failure(error!) }
            
            guard let validData = data where validData.length > 0 else {
                let failureReason = "JSON could not be serialized. Input data was nil or zero length."
                let error = Error.errorWithCode(.JSONSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }
            
            do {
                let JSON = try NSJSONSerialization.JSONObjectWithData(validData, options: .AllowFragments)
                if let JSON = JSON as? M {
                    return .Success(JSON)
                } else {
                    let error = NSError(domain: "com.rahulkatariya.Restofire", code: -1, userInfo: [NSLocalizedDescriptionKey:"TypeMismatch(Expected \(M.self), got \(JSON.dynamicType))"])
                    return .Failure(error)
                }
                
            } catch {
                return .Failure(error as NSError)
            }
            
        }
    }
    
}
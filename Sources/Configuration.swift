//
//  Configuration.swift
//  Restofire
//
//  Created by Rahul Katariya on 24/03/16.
//  Copyright © 2016 AarKay. All rights reserved.
//

import Foundation
import Alamofire

/// A Configuration of RESTful Services. You must provide a `baseURL`.
///
/// ```swift
/// var configuration = Configuration()
/// configuration.baseURL = "http://www.mocky.io/v2/"
/// configuration.headers = ["Content-Type": "application/json"]
/// configuration.acceptableStatusCodes = [200..<300]
/// configuration.acceptableContentTypes = ["application/json"]
/// configuration.logging = true
/// configuration.retryErrorCodes = [NSURLErrorTimedOut,NSURLErrorNetworkConnectionLost]
/// configuration.retryInterval = 20
/// configuration.maxRetryAttempts = 10
/// let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
/// sessionConfiguration.timeoutIntervalForRequest = 7
/// sessionConfiguration.timeoutIntervalForResource = 7
/// sessionConfiguration.HTTPAdditionalHeaders = Manager.defaultHTTPHeaders
/// configuration.manager = Alamofire.Manager(configuration: sessionConfiguration)
/// ```
public struct Configuration {
    
    /// The base URL. `nil` by default.
    public var baseURL: String!
    
    /// The HTTP Method. `.GET` by default.
    public var method: Alamofire.Method = .GET
    
    /// The request parameter encoding. `.JSON` by default.
    public var encoding: Alamofire.ParameterEncoding = .JSON
    
    /// The HTTP headers. `nil` by default.
    public var headers: [String : String]?

    /// The credential. `nil` by default.
    public var credential: NSURLCredential?
    
    /// The Alamofire validation. `nil` by default.
    public var validation: Request.Validation?
    
    /// The acceptable status codes. `nil` by default.
    public var acceptableStatusCodes: [Range<Int>]?
    
    /// The acceptable content types. `nil` by default.
    public var acceptableContentTypes: [String]?
    
    /// The root keypath. `nil` by default.
    public var rootKeyPath: String?
    
    /// The logging, if enabled prints the debug textual representation of the 
    /// request when the response is recieved. `false` by default.
    public var logging: Bool = false
    
    /// The Alamofire Manager. `Alamofire.Manager.sharedInstance` by default.
    public var manager = Alamofire.Manager.sharedInstance
    
    /// The retry error codes. 
    /// `NSURLErrorTimedOut, 
    /// NSURLErrorCannotFindHost,
    /// NSURLErrorCannotConnectToHost,
    /// NSURLErrorDNSLookupFailed,
    /// NSURLErrorNetworkConnectionLost` by default.
    public var retryErrorCodes: Set<Int> = [NSURLErrorTimedOut,
                                  NSURLErrorCannotFindHost,
                                  NSURLErrorCannotConnectToHost,
                                  NSURLErrorDNSLookupFailed,
                                  NSURLErrorNetworkConnectionLost
                                  ]
    
    /// The retry interval. `10` by default.
    public var retryInterval: NSTimeInterval = 10
    
    /// The max retry attempts. `5` by default.
    public var maxRetryAttempts = 5
    
}

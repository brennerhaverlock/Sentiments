//
//  SentimentAnalysisRequest.swift
//  Created by Kyle Weiner on 2/4/16.
//

import Foundation
import Alamofire
import SwiftyJSON
import NaturalLanguage


enum SentimentAnalysisRequestType: String {
    case text, url
}


struct SentimentAnalysisRequest {
    fileprivate(set) var type: SentimentAnalysisRequestType!
    fileprivate(set) var parameterValue: String!

    var completionHandler: (() -> Void)?
    var successHandler: ((String) -> Void)?
    var failureHandler: ((NSError) -> Void)?
    
  
    
    
    init(type: SentimentAnalysisRequestType, parameterValue: String) {
        self.type = type
        self.parameterValue = parameterValue
    }
    //logic for sentiment
    
    
    // passes parameter value
    func make() {
        
      
        
     
        
        
        
    }
/*
    fileprivate var encodedUrl: String {
        let characters = CharacterSet.urlQueryAllowed
        let encodedValue = parameterValue.addingPercentEncoding(withAllowedCharacters: characters)!

        let endpoint = AppConfig.SentimentAnalysisAPI.endpoint
        let key = AppConfig.SentimentAnalysisAPI.key

        return "\(endpoint)?\(type.rawValue)=\(encodedValue)&apikey=\(key)"
    }

    init(type: SentimentAnalysisRequestType, parameterValue: String) {
        self.type = type
        self.parameterValue = parameterValue
    }

    func make() {
        AF.request(encodedUrl).responseJSON { response in
            self.completionHandler?()
            print(JSON(response))
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.successHandler?(json)
            case .failure(let error):
                self.failureHandler?(error as NSError)
            }
        }
    }
 */
}

//
//  UnacademyService.swift
//  Unacademy
//
//  Created by Subhodip Banerjee on 06/03/17.
//  Copyright © 2017 Subhodip Banerjee. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class UnacademyService: NSObject{
    
    //MARK: - Shared Instance
    private static var sharedService: UnacademyService = {
        
        let networkManager = UnacademyService()
        return networkManager
        
    }()
    
    class func sharedInstance() -> UnacademyService {
        
        return sharedService
        
    }
    
    //MARK: - Main API Call
    func getAllCourses(_ completion:@escaping ((UnacademyDatasource?, Error?) -> Void)) {
        
        getAllCoursesService(collection: UnacademyDatasource(), completion: completion)
        
    }
    
    //MARK: - Main API Skeleton
    private func getAllCoursesService(collection:UnacademyDatasource, completion:@escaping ((UnacademyDatasource?, Error?) -> Void)) {
        
        let allCoursesAPI = UrlConstants.tutorialListAPI.appending("bins/87prt")
        Alamofire.request(allCoursesAPI).validate().responseJSON { response in
            
            switch response.result {
                
            case .success:
                
                if let data = response.data {
                    
                    let jsonError:NSErrorPointer? = nil
                    let json = JSON(data: data, options:JSONSerialization.ReadingOptions.allowFragments, error: nil)
                    
                    if let jsonError = jsonError {
                        
                        completion(nil, jsonError as? Error)
                        
                    }
                    else {
                        
                        guard let courseList = json["results"].array else{
                            return
                        }
                        
                        for courseJson in courseList {
                            
                            let courseL = UnacademyAPIResults(json: courseJson)
                            collection.unacademyDatasource.append(courseL)
                            
                        }
                        
                        completion(collection, nil)
                        
                    }
                    
                }
                
            case.failure(let error):
                
                completion(nil, error)
                
            }
            
            
        }
        
    }
    
}

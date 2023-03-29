//
//  NewsPaperResponse.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import Foundation
import ObjectMapper

class NewsPaperDataResponse:Mappable{
    var user:[UserResponse]?
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        user <- map["users"]
    }
}
class UserResponse:Mappable{
    var userName:String?
    var image:String?
    var isSelected = false
    
    required init?(map: ObjectMapper.Map) {
        
    }
    init(){
        
    }
    
    func mapping(map: ObjectMapper.Map) {
       userName <- map["username"]
        image <- map["image"]
        
        
    }
}

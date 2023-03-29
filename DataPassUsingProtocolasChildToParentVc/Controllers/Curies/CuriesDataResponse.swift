//
//  CuriesDataResponse.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import Foundation
import ObjectMapper

class CuriesDataResponse:Mappable{
    var link :LinkResponse?
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        link <- map["_links"]
    }
    
}
class LinkResponse:Mappable{
    var curies:[CurriesResponse]?
    
    required init?(map: ObjectMapper.Map) {
        
    }
    func mapping(map: ObjectMapper.Map) {
        curies <- map["curies"]
    }
}
class CurriesResponse:Mappable{
    var hrel:String?
    var name:String?
    var isSelected = false
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        hrel <- map["href"]
        name <- map["name"]
    }
    init(){
        
    }
    
    
}

//
//  MRTstation.swift
//  hw2Test
//
//  Created by Spada Kao on 2016/5/7.
//  Copyright © 2016年 Spada Kao. All rights reserved.
//

import Foundation
import ObjectMapper

struct Station {
    var name : String!
    var coordinate: [Double]!
    var lines: [String: String]!
}

struct Line {
    var name: String
    var stations: [Station]
}

extension Station: Mappable {
    
    init?(_ map: Map) {
    }
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.coordinate <- map["coordinate"]
        self.lines <- map["lines"]
    }
}

//
//  Filght.swift
//  CodableTestDemo
//
//  Created by MoneyLee on 2018/11/25.
//  Copyright © 2018年 MoneyLee. All rights reserved.
//

import Foundation

struct FlightPlan: Decodable {
    
    var aircraft: Aircraft
    
    var route: [String]
    
    var flightRules: FlightRules
    
    private var departureDates: [String: Date]
    
    var proposedDepartureDate: Date? {
        return departureDates["proposed"]
    }
    
    var actualDepartureDate: Date? {
        return departureDates["actual"]
    }
    
    var remarks: String?
    
    private enum CodingKeys: String, CodingKey {
        case aircraft
        case flightRules = "flight_rules"
        case route
        case departureDates = "departure_time"
        case remarks
    }
}


struct Aircraft: Decodable {
    var identification: String
    var color: String
}


enum FlightRules: String, Decodable {
    case visual = "VFR"
    case instrument = "IFR"
}

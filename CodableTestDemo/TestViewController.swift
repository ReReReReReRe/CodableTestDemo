//
//  TestViewController.swift
//  CodableTestDemo
//
//  Created by MoneyLee on 2018/11/25.
//  Copyright © 2018年 MoneyLee. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    //复杂类型
    //identification 字符串
    //flight_rules 枚举类型
    //route 字符串数组
    //departure_time 时间
    let json = """
        {
            "aircraft": {
            "identification": "NA12345",
            "color": "Blue/White"
            },
            "flight_rules": "IFR",
            "route": ["KTTD", "KHIO"],
            "departure_time": {
                "proposed": "2018-04-20T14:15:00-0700",
                "actual": "2018-04-20T14:20:00-0700"
            },
            "remarks": null
        }
        """.data(using: .utf8)!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let plan = try! decoder.decode(FlightPlan.self, from: json)

        print(plan.aircraft.identification)

        print(plan.actualDepartureDate!)

        print(plan.route)
        
        
    }
    

}

//
//  ViewController.swift
//  CodableTestDemo
//
//  Created by MoneyLee on 2018/11/25.
//  Copyright © 2018年 MoneyLee. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    let json = """
    {
        "name" : "xiaoming",
        "age" : 18,
        "score" : 99.5

    }
    """.data(using: .utf8)!
    
    
    let jsonModels = """
    [
        {
            "name" : "xiaoming",
            "age" : 18,
            "score" : 99.5
        },
        {
            "name" : "daxiong",
            "age" : 19,
            "score" : 66
        }
    ]
    """.data(using: .utf8)!
    

    let jsonComplex = """
    {
        "students" : [
            {
                "name" : "xiaoming",
                "age" : 18,
                "score" : 99.5
            },
            {
                "name" : "daxiong",
                "age" : 19,
                "score" : 66
            }
        ]
    }
    """.data(using: .utf8)!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let decoder = JSONDecoder()
//        let stu = try! decoder.decode(Student.self, from: json)
//
//        print(stu.name)
//        print(stu.age)
//        print(stu.score)
//
//
//        let encoder = JSONEncoder()
//        //想保留初始json中的空格 设置prettyPrinted  否则自动去除前后空格
//        encoder.outputFormatting = .prettyPrinted
//        let reencodedJSON = try! encoder.encode(stu)
//        print(String(data: reencodedJSON, encoding: .utf8)!)
        
        
        
//        let students = try! decoder.decode([Student].self, from: jsonModels)
//        print(students[1].name)
        
        let jsonData = try! decoder.decode([String: [Student]].self, from: jsonComplex)
        let students = jsonData["students"]

        print(students![1].name)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(TestViewController(), animated: true, completion: nil)
    }


}


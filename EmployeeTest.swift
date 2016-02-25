//
//  EmployeeTest.swift
//  CustomizingSwift
//
//  Created by Omar Faruqe on 2016-02-24.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import Foundation

func testEmployee(){
    let fred = Employee(name:"Fred",payGrade:1)
    let barney = Employee(name:"Barney",payGrade:2)

//    *********    1   *********
//    print("\(fred)")
//    debugPrint("\(fred)")
//    
//    print("\(barney)")
//    debugPrint("\(barney)")

//    *********    2   *********
    assert("\(fred)" == "Fred")
    assert("\(barney.debugDescription)" == "Barney:2")
    
    assert(fred == Employee(name: "Fred", payGrade: 1))
    assert(fred != barney)

    assert(barney < fred)
    assert(barney <= fred)
    assert(barney <= barney)
    assert(fred > barney)
    assert(fred >= fred)
    assert(fred >= barney)

/*
    var employees = [fred, barney, Employee(name: "Wilma", payGrade: 3), Employee(name: "Betty", payGrade: 4)]
    
    employees.sortInPlace()
    
    for person in employees {
        print("--->\(person)")
    }
*/
    
    
    let dict = [fred:"fred", barney:"barney"]
    assert(dict[fred] == "fred")
    assert(dict[barney] == "barney")
    
    
    print("testEmployee(): pass")
}
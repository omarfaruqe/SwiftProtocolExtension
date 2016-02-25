//  Employee.swift
//  CustomizingSwift
//
//  Created by Omar Faruqe on 2016-02-24.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import Foundation

public class Employee {
    private let name        :String
    internal let payGrade   :Int
    
    init(name:String, payGrade:Int){
        self.name = name
        self.payGrade = payGrade
    }
}

//-----------------------------------------------------------------------
extension Employee:Equatable{}

public func == (lhs:Employee, rhs:Employee) -> Bool {
    return lhs.name == rhs.name
}

//-----------------------------------------------------------------------
extension Employee:Comparable{}
public func < (lhs:Employee, rhs:Employee) -> Bool {
    return lhs.name < rhs.name
}
public func <= (lhs:Employee, rhs:Employee) -> Bool {
    return lhs.name <= rhs.name
}
public func > (lhs:Employee, rhs:Employee) -> Bool {
    return lhs.name > rhs.name
}
public func >= (lhs:Employee, rhs:Employee) -> Bool {
    return lhs.name >= rhs.name
}

//-----------------------------------------------------------------------
extension Employee: Hashable {
    public var hashValue: Int { return name.hashValue }
}

//-----------------------------------------------------------------------
extension Employee:CustomStringConvertible, CustomDebugStringConvertible{
    public var description: String{
        return name
    }
    public var debugDescription:String{
        return "\(name):\(payGrade)"
    }
}

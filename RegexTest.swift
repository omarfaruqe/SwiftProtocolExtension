//
//  RegexTest.swift
//  CustomizingSwift
//
//  Created by Omar Faruqe on 2016-02-25.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import Foundation

//---------------------------------------------------------
func testRegex(){
    let letters = "[a-z]+"
    let isALetter = try! Regex(letters)
    
    assert(isALetter.matches("abcdef"))
    assert(!isALetter.matches("000"))
    
    assert("\(isALetter)" == letters)
    
    
    let isANumber:Regex = "[0-9]+"
    assert(isANumber.matches("012"))
    

    assert(switchTest("012") == .NUM)
    assert(switchTest("abc") == .LET)
    assert(switchTest("*!@") == .OTHER)
    
    
    assert(isALetter ~ "abcdef")
    assert("abcdef" ~ isALetter)
    assert(isALetter !~ "012")
    assert("012" !~ isALetter)
    assert("abcdef" ~ ~"[a-z]+")
    
    print("testRegex(): pass")
}


//---------------------------------------------------------
enum MatchingType{
    case NUM, LET, OTHER
}
/*
func switchTest(template: String) -> MatchingType {
    switch template{
    case try! Regex("[0-9]+"): return .NUM
    case try! Regex("[a-z]+"): return .LET
    default:
        return .OTHER

    }
}
*/

func switchTest(template: String) -> MatchingType {
    switch template{
    case ~"[0-9]+": return .NUM
    case ~"[a-z]+": return .LET
    default:
        return .OTHER
        
    }
}
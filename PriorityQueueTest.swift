//
//  PriorityQueueTest.swift
//  CustomizingSwift
//
//  Created by Omar Faruqe on 2016-02-25.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import Foundation

func testPriorityQueue(){
//------------------------------------------------------
    let q = PriorityQueue<String,Int>()
    q.append("0", priority:00);     dump(q)
    q.append("1", priority:01);     dump(q)
    q.append("2", priority:02);     dump(q)
    q.append("3", priority:03);     dump(q)
    q.append("4", priority:04);     dump(q)
    q.append("5", priority:05);     dump(q)
    
    assert(q.remove() == "5");      dump(q)
    assert(q.remove() == "4");      dump(q)
    assert(q.remove() == "3");      dump(q)
    assert(q.remove() == "2");      dump(q)
    assert(q.remove() == "1");      dump(q)
    assert(q.remove() == "0");      dump(q)
    
    
//------------------------------------------------------
    let q2 = PriorityQueue<String,Int>()
    
    q2 += ("2",2)       // append another
    q2.append(("0",0))  // append a tuple
    
    q.append("1", priority: 1)
    q.append(q2)        // append a queue
    
    assert( q.remove() == "2")
    assert( q.remove() == "1")
    assert( q.remove() == "0")

    //------------------------------------------------------
    let q3:PriorityQueue<Int,Int> = [(item:0,priority:0), (1,1)]
    
    //------------------------------------------------------
    var q4:PriorityQueue<Int,Int> = [2:2 , 3:3]

    //------------------------------------------------------
    q3.append(q4)
    q3.append( [4:4])
    
    assert( q3.remove() == 4)
    assert( q3.remove() == 3)
    assert( q3.remove() == 2)
    assert( q3.remove() == 1)
    assert( q3.remove() == 0)
    
    //------------------------------------------------------
    q4 = [0:0, 1:1, 2:2]
    
    var i = 2
    for item in q4 {
        assert(item == i--)
    }
    
    
    print("testPriorityQueue(): pass")
}

func dump(q:PriorityQueue<String,Int>){
    debugPrint("\(q)")
}
//
//  PriorityQueue.swift
//  CustomizingSwift
//
//  Created by Omar Faruqe on 2016-02-25.
//  Copyright © 2016 Omar Faruqe. All rights reserved.
//

import Foundation
//---------------------------------------------------------------

public class PriorityQueue <I, P:Comparable>:ArrayLiteralConvertible, DictionaryLiteralConvertible{
    public typealias NodeT =  (item:I, priority:P)
    
    private var queue: [NodeT!] = [nil]
    public var count: Int { return queue.count - 1 }
    private var isSorted = false
    
    // ----------------------------
    public init(){}
    // ----------------------------
    public required init( arrayLiteral elements: (item: I, priority: P)...){
        for element in elements {
            append(element.item, priority: element.priority)
        }
    }
    // ----------------------------
    public required init( dictionaryLiteral elements: (I,P)...) {
        for (item, priority) in elements {
            append(item, priority: priority)
        }
    }
    
    // ----------------------------
    public func append(item: I, priority: P){
        queue.append(NodeT(item:item, priority:priority))
        reheapUp()
        isSorted  = false
    }
    
    private func reheapUp(){
        var current = queue.count - 1
        while current > 0 && current / 2 > 0 {
            let parent = queue[current / 2]
            let child = queue[current]
            
            if parent.priority < child.priority {
                swap(&queue[current], &queue[current / 2])
            }
            current /= 2
        }
    }
    
    public func remove() -> I? {
        if(queue.count <= 1) { return nil }
        if(queue.count == 2){
            return queue.removeLast().item
        }
        let largestItem = queue[1]
        queue[1] = queue.removeLast()
        reheapDown()
        isSorted = false
        return largestItem.item
    }

    private func reheapDown(){
        var root = 1
        while(true) {
            let left:NodeT! = 2*root > queue.count-1 ? nil : queue[2*root]
            let right:NodeT! = 2*root+1 > queue.count-1 ? nil : queue[2*root+1]
            if(left == nil && right == nil){
                break
            }
            let child = root * 2 + ((right == nil || left.priority >= right.priority) ? 0 : 1)
            if queue[root].priority >= queue[child].priority {
                break
            }
            swap(&queue[root], &queue[child])
            root = child
        }
    }
}


//-------------------------------------------------------------------------
extension PriorityQueue: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var output = ""
        for i in 1..<queue.count {
            let node = queue[i]
            output += "\(i): [\(node.item): \(node.priority)]"
        }
        return output
    }
    public var debugDescription: String {
        return description
    }
}

//-------------------------------------------------------------------------
extension PriorityQueue {
    public func append( node: NodeT ){
        append(node.item, priority: node.priority)
    }
    public func append( source: PriorityQueue<I,P>) {
        for i in 1..<source.queue.count {
            append(source.queue[i])
        }
    }
}


//-------------------------------------------------------------------------
public func += <I,P>(lhs: PriorityQueue<I,P>, rhs: (I,P)){
    lhs.append(rhs)
}


// -------------------------- for loop in queue ----------------------------
extension PriorityQueue {
    private func getItemsInPriorityOrder() -> [I] {
        if !isSorted {
            isSorted = true
            queue.sortInPlace{
                return ($0 == nil) ? true  :
                       ($1 == nil) ? false :
                            $0.priority > $1.priority
            }
        }
        var items: [I] = []
        for i in 1..<queue.count {
            items.append( queue[i].item)
        }
        return items
    }
}

// ----------------------------------------------------------------------
extension PriorityQueue: SequenceType {
    public func generate() -> _PriorityQueueIterator<I> {
        return _PriorityQueueIterator<I>(items: getItemsInPriorityOrder())
    }
}
// ----------------------------------------------------------------------
public struct _PriorityQueueIterator <I> : GeneratorType {
    private let items: [I]
    private var index = 0
    
    init(items: [I]){
        self.items = items
    }
    
    public mutating func next() -> I? {
        return index  >=  items.count ? nil : items[index++] // this giving the error
    }
}
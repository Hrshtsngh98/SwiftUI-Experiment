//
//  OperationQueueExp.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 1/24/26.
//

import Foundation

class OperationQueueExp {
    
    func startTasks() {
        let operation1 = BlockOperation {
            print("1")
        }
        let operation2 = Operation()
        operation2.addDependency(operation1)
        operation2.completionBlock = {
            print("2")
        }
        
        let operation3 = BlockOperation {
            print("3")
        }
        operation1.addDependency(operation3)
        
        let queue = OperationQueue()
        
        queue.qualityOfService = .background
        queue.addOperation(operation1)
        queue.addOperation(operation2)
        queue.addOperation(operation3)
        
    }
}

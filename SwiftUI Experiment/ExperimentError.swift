//
//  ExperimentError.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 1/16/26.
//

import Foundation

enum ParseError: Error {
    
}

enum NetworkError: Error {
    
}

func doSomething() {
    do {
        let data = try JSONDecoder().decode(Int.self, from: Data())
    } catch is ParseError {
        
    } catch is NetworkError {
        
    } catch {
        
    }
}

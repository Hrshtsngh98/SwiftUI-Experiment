//
//  SwiftUI_ExperimentApp.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 1/11/26.
//

import SwiftUI
import BackgroundTasks

@main
struct SwiftUI_ExperimentApp: App {
    let connectivityHelper = ConnectivityHelper()
    
    var body: some Scene {
        WindowGroup {
            TabViewTestView()
                .task {
                    connectivityHelper.startMonitoring()
                }
                .task {
//                    BGTaskScheduler.shared.register(forTaskWithIdentifier: "FIRST BACKGROUND TASK", using: nil) { task in
//                        print("Task app refresh starting")
//                        self.handleAppRefresh(task: task as! BGAppRefreshTask)
//                    }
                }
        }
        .backgroundTask(.appRefresh("FIRST BACKGROUND TASK")) { task in
            print("DOING SOMETHING HERE")
            await handleAppRefresh()
        }
    }
    
    func handleAppRefresh() {
//    func handleAppRefresh(task: BGAppRefreshTask) {
        scheduleAppRefresh()
        // Perform your background operation
        print("Task app refresh scheduled")
//        task.setTaskCompleted(success: true)
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "FIRST BACKGROUND TASK")
//        request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60) // 15 minutes
        request.earliestBeginDate = .now + 5
        
        do {
            print("Task app refresh works")
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Failed to submit request: \(error)")
        }
    }
    
    
//    func setupBackgroudTask(task: BGAppRefreshTask) {
//        let request = BGAppRefreshTaskRequest(identifier: "harshit.SwiftUI-Experiment")
//        // Optional: set an earliest begin date (system decides the actual time after this date)
//        //        request.earliestBeginDate = Date(timeIntervalSinceNow: 1 * 60 * 60) // not sooner than 1 hour
//        request.earliestBeginDate = .now
//        
//        do {
//            try BGTaskScheduler.shared.submit(request)
//            
//            for i in 1..<100 {
//                //                    try? await Task.sleep(for: .seconds(1))
//                print("Threat at index \(i)")
//            }
//            
//            print("Background task scheduled")
//        } catch {
//            print("Could not schedule task: \(error.localizedDescription)")
//        }
//    }
}

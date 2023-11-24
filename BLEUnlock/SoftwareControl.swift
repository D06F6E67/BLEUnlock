import Foundation
import Cocoa

let appBundleIdentifier = "com.west2online.ClashXPro"

class SC {
    
    // 打开软件
    func openApp() {
        
        if appIsRunning(bundleIdentifier: appBundleIdentifier) {
            return
        }
        
        NSWorkspace.shared.launchApplication(withBundleIdentifier: appBundleIdentifier, options: [], additionalEventParamDescriptor: nil, launchIdentifier: nil)
    }
    
    // 关闭软件
    func killApp() {
        
        if getHost() < 18 {
            return
        }
        
        if !appIsRunning(bundleIdentifier: appBundleIdentifier) {
            return
        }
        
        if let app = NSRunningApplication
            .runningApplications(withBundleIdentifier: appBundleIdentifier)
            .first {

            app.terminate()
        }
    }
    
    // 软件是否正在运行
    func appIsRunning(bundleIdentifier: String) -> Bool {
        let workspace = NSWorkspace.shared
        let runningApps = workspace.runningApplications
        return runningApps.contains { $0.bundleIdentifier == bundleIdentifier }
    }
    
    func getHost() -> Int {

        let calendar = Calendar.current
        return calendar.component(.hour, from: Date())
    }
}

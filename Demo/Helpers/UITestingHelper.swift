import Foundation

struct UITestingHelper {

    static var processInfoUITestingArgument = "-ui-testing"

    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains(processInfoUITestingArgument)
    }

}

import SwiftUI

@main
struct DemoApp: App {

    @StateObject var userService: UserService

    init() {
        if UITestingHelper.isUITesting {

            self._userService = StateObject(
                wrappedValue: UserService(storage: InMemoryUserStorage()))

        } else {

            self._userService = StateObject(
                wrappedValue: UserService(storage: UserDefaultsUserStorage()))
        }
    }

    var body: some Scene {
        WindowGroup {

            if userService.user != nil {

                ConfirmationView(
                    viewModel: ConfirmationViewModel(
                        userService: userService))
                .transition(AnyTransition.viewSwapTransition)

            } else {

                RegistrationView(
                    viewModel: RegistrationViewModel(
                        userService: userService))
                .transition(AnyTransition.viewSwapTransition)
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
#if DEBUG || TESTING
        print("Is UI Test Running: \(UITestingHelper.isUITesting)")
#endif
        return true
    }
}

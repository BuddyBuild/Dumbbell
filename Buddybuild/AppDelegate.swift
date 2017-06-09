import UIKit
import Dumbbell

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var client: Client!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let key = ProcessInfo.processInfo.environment["BB_API_KEY"].flatMap(Client.APIKey.init)!

        client = Client(credentials: key)
        client.execute(Apps.list) { result in
            print("Coucou = \(result)")
        }

        return true
    }

}


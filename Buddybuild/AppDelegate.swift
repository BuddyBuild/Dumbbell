import UIKit
import Dumbbell

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var client: Client!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let key = ProcessInfo.processInfo.environment["BB_API_KEY"].flatMap(Client.APIKey.init)!
        client = Client(credentials: key)

        let rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! AppsViewController

        let window = UIWindow()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window

        client.execute(Apps.list) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(apps):
                    print("Got apps \(apps)")
                    rootViewController.apps = apps
                case let .failure(error):
                    print("Got errors \(error)")
                }
            }
        }

        return true
    }

}


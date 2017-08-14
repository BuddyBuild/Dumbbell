//
//  ViewController.swift
//  Buddybuild
//
//  Created by Romain Pouclet on 2017-08-14.
//  Copyright © 2017 Buddybuild. All rights reserved.
//

import UIKit
import Dumbbell

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let token = ProcessInfo.processInfo.environment["BUDDYBUILD_TOKEN"]!

        let c = Client(credentials: Client.APIKey(token))
        c.execute(Apps.list) { result in
            switch result {
            case let .success(apps):
                print("Found \(apps.count) app(s)")
            case let .failure(error):
                print("Unable to fetch apps, got error: \(error)")
            }
        }
    }

}


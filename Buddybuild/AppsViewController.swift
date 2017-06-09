import UIKit
import Dumbbell

class AppsViewController: UITableViewController {

    var apps = [App]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Application", for: indexPath) as! ApplicationCell
        cell.appLabel.text = apps[indexPath.row].name
        return cell
    }

}


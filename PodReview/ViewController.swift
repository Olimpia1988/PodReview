import UIKit
import MGSwipeTableCell

class ViewController: UIViewController {
    
    var objects = [LibraryWrapper]()
    let tableView = TableViewView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9203030467, green: 0.8145338893, blue: 0.9443410039, alpha: 1)
        view.addSubview(tableView)
        tableView.tableView.delegate = self
        tableView.tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        objects = LibraryWrapper.getLibraries(from: GetLocation.getData(name: "BklynLibraryInfo", type: "json"))
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let objectsToSet = objects[indexPath.row]
        cell.textLabel?.text = objectsToSet.title
        
        //create butrtons to the left
        cell.leftButtons = [MGSwipeButton(title: "Add to list", icon: UIImage(named: "icons8-wish_list"), backgroundColor: .lightGray, callback: { (cell) -> Bool in
            print("An action has to be added here")
            return true
        })]
        cell.leftSwipeSettings.transition = .rotate3D
        
        
        //create right buttons
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: .red, callback: { (cell) -> Bool in
            self.objects.remove(at: indexPath.row)
            let indexPath = IndexPath(item: indexPath.row,section: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            return true
        })]
        
        cell.layer.cornerRadius = 25
        cell.backgroundColor = #colorLiteral(red: 0.7394374013, green: 0.6397964358, blue: 0.9213000536, alpha: 1)
        cell.clipsToBounds = true
        cell.layoutIfNeeded()
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

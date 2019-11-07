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
        loadData()
    }
    
    func loadData() {
        objects = LibraryWrapper.getLibraries(from: GetLocation.getData(name: "BklynLibraryInfo", type: "json"))
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}

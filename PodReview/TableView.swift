
import UIKit
import MGSwipeTableCell

class TableViewView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 0.9203030467, green: 0.8145338893, blue: 0.9443410039, alpha: 1)
        tableView.frame = bounds
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        comminInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func comminInit() {
        addSubview(tableView)
    }
    
    
}

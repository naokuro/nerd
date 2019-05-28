import UIKit
import XCPlayground
import PlaygroundSupport

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    private let itemListViewModel: ItemListViewModel = ItemListViewModel()
    private var itemList: ItemList!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        self.tableView = UITableView(frame:self.view.frame)
        self.tableView!.dataSource = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let text = self.items[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
}

var ctrl = ViewController()
PlaygroundPage.current.liveView = ctrl

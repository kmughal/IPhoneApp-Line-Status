//import UIKit
import RxSwift
import RxCocoa

class LineStatusViewController: UIViewController {
    private var table:LineStatusTable = LineStatusTable(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func revertColor() {
        self.view.backgroundColor = UIColor.white
    }
    
    func removeAllSubViews() {
        self.view.subviews.forEach({$0.removeFromSuperview()})
    }
    
    func createLineStatusTableView(data:LineStatusViewModel) {
         self.table = LineStatusTable(frame: CGRect(
            x: 0,
            y: 50,
            width: self.view.bounds.width,
            height: self.view.bounds.height))
        
        table.viewModel = data
        self.view.addSubview(self.table)
        table.reloadData()
        table.viewDidLoad()
        table.separatorStyle = .none
        table.backgroundColor = .blue
    }
    
    func updateDataset(data:LineStatusViewModel) {
        Shared.Instance.updateUI {
            self.view.backgroundColor = .white
            self.removeAllSubViews()
            self.createLineStatusTableView(data:data)
            
        }
    }
    
    func getLineStatus() {
         let builder = LineStatusBuilder()
        builder.build().subscribe(onNext: { data in
           self.updateDataset(data: data)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor.lightGray
        self.getLineStatus()
        Shared.Instance.runCodeInIntervals(interval: 500, code: {
            self.getLineStatus()
        })
        self.view.backgroundColor = UIColor.yellow
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view.layoutIfNeeded()
        self.table.frame = CGRect(
            x: 0,
            y: 50,
            width: size.width,
            height: size.height)
    }
}

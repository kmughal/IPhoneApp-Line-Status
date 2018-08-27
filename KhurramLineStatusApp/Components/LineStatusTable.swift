import Foundation
import UIKit

class LineStatusTable : UITableView,UITableViewDelegate, UITableViewDataSource {
    private let cellId = "LineStatusTableViewCell"
    public var viewModel = LineStatusViewModel.init(style: "", cardPacks: [CardPack]())
    private let cellHeight = 90
    private let Johnston100Regular = "Johnston100-Regular"
    private let Johnston100Medium = "Johnston100-Medium"
    
    func viewDidLoad() {
        register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        delegate = self
        dataSource = self
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cardPacks[section].cardGroups[0].cards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return CGFloat(self.cellHeight)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.cardPacks.count
    }
    
    func addLineColor(cell:UITableViewCell,color:UIColor) {
        let border = CALayer()
        border.setLeftBorder(width: 20, height: Float(self.cellHeight), color: color)
        cell.layer.addSublayer(border)
    }
    
    func addLineName(cell:UITableViewCell,name:String) {
        cell.textLabel?.text = "   \(name)"
        cell.textLabel?.setFont(name: self.Johnston100Regular)
    }
    
    func addLineStatus(cell:UITableViewCell,message:String) {
        cell.detailTextLabel?.text = message
        cell.detailTextLabel?.setFont(name: self.Johnston100Medium)
    }
    
    func addOverallStatusMessage(cell:UITableViewCell,message:String) {
        cell.backgroundColor = .blue
        cell.textLabel?.textColor = .white
        addLineColor(cell: cell, color: .blue)
        cell.textLabel?.font =  UIFont(name: self.Johnston100Regular, size: 30)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel.cardPacks[indexPath.section].cardGroups[0].cards[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: cellId)
        addLineName(cell: cell, name: item.line)
        addLineStatus(cell: cell, message: item.name)
        addLineColor(cell: cell, color: UIColor.lineColor(name: item.line))
        if item.style == CardStyles.OverallStatus {
            addOverallStatusMessage(cell: cell, message: item.line)
        }
        return cell
    }
}

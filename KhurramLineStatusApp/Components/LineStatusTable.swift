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
    
    func addLineStatus(cell:UITableViewCell,lineMessageCard: LineMessageCard) {
        cell.detailTextLabel?.setFont(name: self.Johnston100Medium)
        cell.detailTextLabel?.text = lineMessageCard.message
    }
    
    func addOverallStatusMessage(cell:UITableViewCell,message:String) {
        cell.backgroundColor = .blue
        cell.textLabel?.textColor = .white
        addLineColor(cell: cell, color: .blue)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font =  UIFont(name: self.Johnston100Regular, size: 30)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = viewModel.cardPacks[indexPath.section].cardGroups[0].cards[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: cellId)
        
        if item is LineMessageCard {
            let lineMessage = (item as! LineMessageCard)
            addLineName(cell: cell, name: lineMessage.line)
            addLineStatus(cell: cell, lineMessageCard: lineMessage)
            addLineColor(cell: cell, color: UIColor.lineColor(name: lineMessage.line))
        } else if item is OverallStatusCard {
             let overAllStatus = (item as! OverallStatusCard)
             addOverallStatusMessage(cell: cell, message: overAllStatus.message)
        }
       
       
        return cell
    }
}


//import MarqueeLabel
//        var lbl = MarqueeLabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150), duration: 100.0, andFadeLength: 5.0)
//        lbl?.text = messages.joined()
//        cell.addSubview(lbl!)


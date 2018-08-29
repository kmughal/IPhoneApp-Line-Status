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
        cell.detailTextLabel?.text = "Loading ..."
    }
    
    func addOverallStatusMessage(cell:UITableViewCell,message:String) {
        cell.backgroundColor = Shared.Instance.DARK_BLUE
        cell.textLabel?.textColor = .white
        addLineColor(cell: cell, color: Shared.Instance.DARK_BLUE)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font =  UIFont(name: self.Johnston100Regular, size: 30)
        cell.textLabel?.text = message
    }
    
    func addOverallGoodStatusMessage(cell:UITableViewCell,message:String) {
        cell.backgroundColor = Shared.Instance.DARK_BLUE
        cell.textLabel?.textColor = .white
        addLineColor(cell: cell, color: Shared.Instance.DARK_BLUE)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = message
        cell.textLabel?.font =  UIFont(name: self.Johnston100Regular, size: 40)
    }
    
    func addOverallGoodStatusServiceModesMessage(cell:UITableViewCell,message:String) {
        cell.backgroundColor = Shared.Instance.DARK_BLUE
        cell.textLabel?.textColor = .white
        addLineColor(cell: cell, color: Shared.Instance.DARK_BLUE)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font =  UIFont(name: self.Johnston100Medium, size: 30)
        cell.textLabel?.text = "\n\n\n\n\n\n\n \(message.replacingOccurrences(of: ",", with: "\n"))"
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
        } else if item is OverallGoodStatusCard {
            let overAllStatus = (item as! OverallGoodStatusCard)
            addOverallGoodStatusMessage(cell: cell, message: overAllStatus.message)
        } else if item is OverallGoodStatusServiceModesCard {
            let entry = (item as! OverallGoodStatusServiceModesCard)
            addOverallGoodStatusServiceModesMessage(cell: cell, message: entry.message)
        }
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let lastRowIndex = tableView.numberOfRows(inSection: 0)
        if indexPath.row == lastRowIndex - 1 {
            let messages = LineStatusTableHelpers.Instance.flatMessages(lineStatusViewModel: viewModel)
            if messages.count > 0 {
                LineStatusTableHelpers
                    .Instance
                    .updateStatus(
                        totalRows: lastRowIndex + 1,
                        tableView: tableView,
                        messages:messages)
            }
        }
    }
}

//import MarqueeLabel
//        var lbl = MarqueeLabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150), duration: 100.0, andFadeLength: 5.0)
//        lbl?.text = messages.joined()
//        cell.addSubview(lbl!)



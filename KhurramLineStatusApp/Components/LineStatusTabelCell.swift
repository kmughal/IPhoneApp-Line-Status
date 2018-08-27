import Foundation
import UIKit

// This is being used but i have added this so might be useful
class LineStatusTableCell : UITableViewCell  {
    
    var Fields : LineStatusCellField? {
        didSet {
            lineNameLabel.text = Fields?.name
            lineStatusLabel.text = Fields?.status
            lineColorLayer.layer.backgroundColor = Fields?.color.cgColor
        }
    }
    
    private let lineColorLayer : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 0, width: 15, height: 50)
        label.text = "  "
        label.layer.setLeftBorder(width: 25, height: 50, color: UIColor.blue)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 100.00)
        return label
    }()
    
    private let lineNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 0, width: 100, height: 50)
        label.setFont(name: "Johnston100-Regular")
        return label
    }()
    
    private let lineStatusLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y:  200, width: 100, height: 50)
        label.setFont(name: "Johnston100-Regular")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func addSubview(label:UILabel) {
        self.addSubview(label)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addStackView() {
        let stackView   = UIStackView()
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .fill
        stackView.spacing   = 16.0
        
        stackView.addArrangedSubview(lineColorLayer)
        stackView.addArrangedSubview(lineNameLabel)
        stackView.addArrangedSubview(lineStatusLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addStackView()
    }
}

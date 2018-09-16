import Foundation
import UIKit

class LineStatusTableHelpers {

    static var Instance: LineStatusTableHelpers = LineStatusTableHelpers()

    private func cleanMessage(message: String) -> String {
        return message.replacingOccurrences(of: "Underground Station", with: "")
            .replacingOccurrences(of: "Rail Station", with: "")
    }

    private func getFriendlyMessages(message: String, cardParts: [CardPart]) -> [String] {
        var messages = [String]()
        for l in cardParts {
            if l is ComplexCardPart {
                let complexCardPart = l as! ComplexCardPart
                messages.append(cleanMessage(message: "\(message) \n \(complexCardPart.from) .. \(complexCardPart.to)"))
            }
        }
        return messages
    }

    func flatMessages(lineStatusViewModel: LineStatusViewModel) -> [CardPartsMessages] {

        if lineStatusViewModel.cardPacks.count > 0 &&
            lineStatusViewModel.cardPacks[0].cardGroups.count > 0 {

            let cards = lineStatusViewModel.cardPacks.first?.cardGroups.first?.cards

            var result = [CardPartsMessages]()
            for card in cards! {
                if card is LineMessageCard {
                    let lineMessageCard = card as! LineMessageCard
                    let messages = getFriendlyMessages(
                        message: lineMessageCard.message,
                        cardParts: lineMessageCard.cardParts)
                    result.append(CardPartsMessages.init(messages: messages))
                }
            }
            return result
        }
        return [CardPartsMessages]()
        }


        func updateStatus(totalRows: Int,
                          tableView: UITableView,
                          messages: [CardPartsMessages]) -> Void {

            var counters = Array.init(repeating: 0, count: totalRows)
            let r = Shared.Instance.runCodeInIntervals(
                interval: 2,
                code: {
                    Shared.Instance.updateUI {
                        if messages.count > 0 {
                            for index in 0..<tableView.visibleCells.count - 1 {
                                tableView.visibleCells[index].detailTextLabel?.text = messages[index].messages[counters[index]]
                                tableView.visibleCells[index].detailTextLabel?.numberOfLines = 0
                                tableView.visibleCells[index].detailTextLabel?.startAnimation(duration: 0.5)
                            }

                            for index in 0..<counters.count - 1 {
                                counters[index] = (counters[index] + 1 >= messages[index].messages.count) ?
                                0: (counters[index] + 1)
                            }
                        }
                    }
                })
            print(r)
        }
    }

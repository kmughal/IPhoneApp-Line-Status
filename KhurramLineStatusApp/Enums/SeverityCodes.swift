import Foundation

enum SeverityCodes : Int
{
    case SpecialService = 0
    case Closed = 1
    case Suspended = 2
    case PartSuspended = 3
    case PlannedClosure = 4
    case PartClosure = 5
    case SevereDelays = 6
    case ReduceService = 7
    case BusService = 8
    case MinorDelays = 9
    case GoodService = 10
    case ServiceClosed = 20
}

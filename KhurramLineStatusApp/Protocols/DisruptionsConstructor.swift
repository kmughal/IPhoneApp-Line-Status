import Foundation

protocol DisruptionsConstructor {
    func build(vm:LineStatusViewModel,apiVm: ApiLineStatusViewModel) -> LineStatusViewModel
}

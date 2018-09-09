import Foundation

protocol GoodServicesConstructor {
    func build(vm:LineStatusViewModel,apiVm:ApiLineStatusViewModel) -> LineStatusViewModel
}

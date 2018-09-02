import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        
        defaultContainer.register(ApiEndPointUrls.self) { _ in ApiEndPoints() }
        
        defaultContainer.register(DisruptionsConstructor.self) { _ in DisruptionsBuilder() }
        
        defaultContainer.register(GoodServicesConstructor.self) { _ in GoodServicesBuilder() }
        
        
        defaultContainer.register(Requestable.self) { r in
            let jsonClient = JsonClient()
            return jsonClient
        }
        
        defaultContainer.register(ApiService.self) { r in
            let jsonClient = r.resolve(Requestable.self)!
            let apiEndPoints = r.resolve(ApiEndPointUrls.self)
            let apiService = ApiService(apiEndPointHelper: apiEndPoints as! ApiEndPoints, client: jsonClient)
            return apiService
        }
        
        defaultContainer.register(ApiLineStatusViewModelBuilder.self) { r in
            let apiService = r.resolve(ApiService.self)!
            let builder = ApiLineStatusViewModelBuilder(lineStatusService: apiService)
            return builder
        }
        
        defaultContainer.register(LineStatusBuilder.self) { r in
            
            let apiStatusBuilder = r.resolve(ApiLineStatusViewModelBuilder.self)
            let disruptionBuilder = r.resolve(DisruptionsConstructor.self)
            let goodServiceBuilder = r.resolve(GoodServicesConstructor.self)
            
            let builder = LineStatusBuilder(
                apiViewModelBuilder: apiStatusBuilder!,
                goodServiceBiulder: goodServiceBuilder as! GoodServicesBuilder,
                disruptionBiulder: disruptionBuilder as! DisruptionsBuilder)
            
            return builder
        }
        
        defaultContainer.storyboardInitCompleted(LineStatusViewController.self) { r,c in
            let lineStatusBuilder = r.resolve(LineStatusBuilder.self)
            c.lineStatusBuilder = lineStatusBuilder!
        }
    }
}

import Foundation

protocol LocationScreenProtocol{
    
}
protocol LocationPresenterProtocol{
    init(view: LocationScreenProtocol, network: NetworkLayerProtocol, locationInfo: String, router: RouterProtocol)
    
    var locationInfo: String? {get set}
    
}
final class LocationPresenter: LocationPresenterProtocol{
    
    
    var locationInfo: String?
    let view: LocationScreenProtocol?
    let network: NetworkLayerProtocol?
    let router: RouterProtocol?
    
    init(view: any LocationScreenProtocol, network: any NetworkLayerProtocol, locationInfo: String, router: RouterProtocol) {
        self.view = view
        self.network = network
        self.locationInfo = locationInfo
        self.router = router
    }
    
}

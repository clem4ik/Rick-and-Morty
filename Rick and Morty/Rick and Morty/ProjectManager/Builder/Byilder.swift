import Foundation
import UIKit

protocol ByilderProtocol{
    func createHelloScreen(router: RouterProtocol)-> UIViewController
    func createFirstScreen(router: RouterProtocol, characterArr: [Character2])->UIViewController
    func createLocationScreen(router: RouterProtocol, locationInfo: String)->UIViewController
}
class Byilder: ByilderProtocol{

    func createHelloScreen(router: RouterProtocol)-> UIViewController {
        let view = FirstVC()
        let network = Network()
        let presenter = FirstPresenter(view: view, router: router, network: network)
        view.presenter = presenter
        return view
    }
    
    func createFirstScreen(router: RouterProtocol, characterArr: [Character2]) -> UIViewController {
        let view = ViewController()
        //let model = FirstScreenModel()
        let network = Network()
        let presenter = FirstScreenPresenter(view: view, network: network, characterArr: characterArr, router: router)
        view.presenter = presenter
        return view
    }
    func createLocationScreen(router: RouterProtocol, locationInfo: String) -> UIViewController {
        let view = LocationInfoController()
        let network = Network()
        let presenter = LocationPresenter(view: view, network: network, locationInfo: locationInfo, router: router)
        view.presenter = presenter
        return view
    }
}

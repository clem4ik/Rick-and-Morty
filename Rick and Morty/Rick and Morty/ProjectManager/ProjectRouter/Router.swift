import Foundation
import UIKit

protocol RouterMainProtocol{
    var navigationController: UINavigationController? {get set}
    var byilder: ByilderProtocol? {get set}
    
}
protocol RouterProtocol: RouterMainProtocol{
    func createHelloScreen()
    func createFirstScreen(arrChar: [Character2])
    func createLocationScreen(locationInfo: String)
}
class Router: RouterProtocol{
    
    var navigationController: UINavigationController?
    
    var byilder: ByilderProtocol?
    
    init(byilder: ByilderProtocol, navVC: UINavigationController){
        self.byilder = byilder
        self.navigationController = navVC
    }
    
    func createHelloScreen() {
        if let navigationController = navigationController{
            guard let helloScreen = byilder?.createHelloScreen(router: self) else {return}
            navigationController.pushViewController(helloScreen, animated: true)
        }
    }
    
    func createFirstScreen(arrChar: [Character2]) {
        if let navigationController = navigationController{
            guard let firstScreen = byilder?.createFirstScreen(router: self, characterArr: arrChar) else {return}
            navigationController.pushViewController(firstScreen, animated: true)
        }
    }
    func createLocationScreen(locationInfo: String) {
        if let navigationController = navigationController{
            guard let locationScreen = byilder?.createLocationScreen(router: self, locationInfo: locationInfo) else {return}
            navigationController.pushViewController(locationScreen, animated: true)
        }
    }
    
}

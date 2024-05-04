import Foundation

protocol FirstVCProtocol{
    
}

protocol FirstPresenterProtocol{
    init(view: FirstVCProtocol, router: RouterProtocol, network: NetworkLayerProtocol)
    
    func tupOnButton()
}

class FirstPresenter: FirstPresenterProtocol{
    
    let view: FirstVCProtocol?
    let router: RouterProtocol?
    let network: NetworkLayerProtocol?
    
    var charArr: [Character2]?
    
    required init(view: any FirstVCProtocol, router: any RouterProtocol, network: NetworkLayerProtocol) {
        self.view = view
        self.router = router
        self.network = network
        
        getAllChar()
    }
    
    func getAllChar() {
        network?.getAllCharacter(compliton: { [weak self] result in
            guard let self = self else{return}
            DispatchQueue.main.async {
                switch result{
                case .success(let allChar):
                    self.charArr = allChar.results
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
    
    func tupOnButton() {
        router?.createFirstScreen(arrChar: charArr!)
    }
    
}

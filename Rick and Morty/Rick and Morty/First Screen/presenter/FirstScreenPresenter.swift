import Foundation

protocol FirstScreenProtocol{
    
}
protocol FirstScreenPresenterProtocol{
    init (view: FirstScreenProtocol, network: NetworkLayerProtocol, characterArr: [Character2], router: RouterProtocol)
    
    var charArr: [Character2] {get set}
    var menCharacter: [Character2]? {get set}
    var woomenCharacter: [Character2]? {get set}
    var recomendationArr: [Character2]? {get set}
    
    func tapOnCell(location: String)
    func tapOnRecomendationButton(recomendationArr: [Character2])
    func pushRecomendationCell(element: Character2)
    
}
final class FirstScreenPresenter: FirstScreenPresenterProtocol{
    
    var menCharacter: [Character2]?
    var woomenCharacter: [Character2]?
    let network: NetworkLayerProtocol?
    let view: FirstScreenProtocol?
    let router: RouterProtocol?
    
    var charArr: [Character2]
    var recomendationArr: [Character2]?
    
    required init(view: FirstScreenProtocol, network: NetworkLayerProtocol, characterArr: [Character2], router: RouterProtocol) {
        self.view = view
        self.charArr = characterArr
        self.network = network
        self.router = router
       
        menCharacter = secondSort()
        woomenCharacter = sortedGender()
        
    }
    
    func sortedGender()->[Character2] {
        var newArr: [Character2] = []
        
        for i in charArr{
            
            if i.gender.gender == "Fealm"{
                newArr.append(i)
            }
        }
        return newArr
    }
    
    func secondSort() -> [Character2]{
        var newArr: [Character2] = []
        
        for i in charArr{
            
            if i.gender.gender == "Male"{
                newArr.append(i)
            }
        }
        return newArr
    }
    
    func tapOnCell(location: String) {
        router?.createLocationScreen(locationInfo: location)
    }
    
    func pushRecomendationCell(element: Character2){
        recomendationArr?.append(element)
    }
    
    func tapOnRecomendationButton(recomendationArr: [Character2]) {
        
    }
    
}

import Foundation
import Alamofire

protocol NetworkLayerProtocol{
    func getAllCharacter(compliton: @escaping(Result<ArrCharacter, Error>)->())
}
class Network: NetworkLayerProtocol{
    func getAllCharacter(compliton: @escaping (Result<ArrCharacter, any Error>) -> ()) {
        
        let url = "https://rickandmortyapi.com/api/character"
        
        AF.request(url, method: .get)
            .validate()
            .response { responce in
                guard let data = responce.data else{
                    if let error = responce.error{
                        compliton(.failure(error))
                    }
                    return
                }
                print(responce)
                let decoder = JSONDecoder()
                guard let anserw = try? decoder.decode(ArrCharacter.self, from: data) else{
                    fatalError()
                }
                compliton(.success(anserw))
            }.resume()
    }
    
}

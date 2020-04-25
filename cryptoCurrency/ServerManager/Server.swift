import Foundation
import Alamofire

class Servers {
    
    static let shared = Servers()
    
    let key = "fba302edfc8ef66a86a95a89201a2378b546167c7efda7b79ac6b42afd5b5bdd"
    let main = "https://min-api.cryptocompare.com/data/top/totalvolfull?limit=10&"
    let tsym = "tsym=USD"
    
    func updateCryptoCurrencyInfo(completion: @escaping (Welcome)->()){
        let url = "\(main)\(tsym)&api_key=\(key)"
        AF.request(url).validate().responseDecodable(of: Welcome.self){ (response) in
            guard let data = response.value else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    let history = "https://min-api.cryptocompare.com/data/v2/histoday?fsym="
    var name:String?
    
    func createChart(completion: @escaping (Chart)->()){
        let url = "\(history)\(name!)&\(tsym)&limit=30&api_key=\(key)"
        AF.request(url).validate().responseDecodable(of: Chart.self){ (response) in
            guard let data = response.value else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}


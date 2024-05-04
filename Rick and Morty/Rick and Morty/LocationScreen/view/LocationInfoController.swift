import UIKit

class LocationInfoController: UIViewController {
    
    var presenter: LocationPresenterProtocol!
    
    private let label: UILabel = {
       var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.green
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = presenter.locationInfo
        view.backgroundColor = UIColor.white
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setLabel()
    }
    
    func setLabel(){
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
extension LocationInfoController: LocationScreenProtocol{
    
}

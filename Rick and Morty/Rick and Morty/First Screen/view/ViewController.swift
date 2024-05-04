import UIKit

class ViewController: UIViewController {
    
    private var statment = State.normal
    
    var presenter: FirstScreenPresenterProtocol!

    private var collectionView: UICollectionView!
    
    private let layout: UICollectionViewFlowLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 350)
        return layout
    }()
    
    
    private let filtersForGenderButtonSortMen: UIButton = {
       var button = UIButton()
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 15
        button.setTitle("Показать мужских персонажей", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let filtersForGenderButtonSortWooman: UIButton = {
        var button = UIButton()
         button.backgroundColor = UIColor.systemPink
         button.layer.cornerRadius = 15
         button.setTitle("Показать женских персонажей", for: .normal)
         button.setTitleColor(UIColor.black, for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
    }()
    
    private let basicState: UIButton = {
        var button = UIButton()
         button.backgroundColor = UIColor.black
         button.layer.cornerRadius = 15
         button.setTitle("Вернуться к исходному списку", for: .normal)
         button.setTitleColor(UIColor.white, for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
    }()
    
    private var filtredCharacters: [Character2]?
    private let search = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = search.searchBar.text else {return false}
        return text.isEmpty
    }
    private var isFiltering: Bool{
        return search.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        registerCollection()
        settingsSearchController()
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setGenderSortButton(button: filtersForGenderButtonSortMen, topAnchor: 150)
        setGenderSortButton(button: filtersForGenderButtonSortWooman, topAnchor: 200)
        setGenderSortButton(button: basicState, topAnchor: 250)
        setCollectionView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        filtersForGenderButtonSortWooman.addTarget(self, action: #selector(sortWoomen), for: .touchUpInside)
        filtersForGenderButtonSortMen.addTarget(self, action: #selector(sortMen), for: .touchUpInside)
        basicState.addTarget(self, action: #selector(sortBase), for: .touchUpInside)
    }

    func registerCollection(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FirstCell.self, forCellWithReuseIdentifier: "First")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func setCollectionView(){
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setGenderSortButton(button: UIButton, topAnchor: CGFloat){
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor,constant: topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 150)
        
        ])
    }
    
    func settingsSearchController(){
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Введите имя персоажа"
        navigationItem.searchController = search
        definesPresentationContext = true
    }

}
extension ViewController: FirstScreenProtocol{
    
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering{
            return filtredCharacters!.count
        }else{
            switch statment{
            case .normal:
                return presenter.charArr.count
            case .woomen:
                return presenter.woomenCharacter!.count
            case .man:
                return presenter.menCharacter!.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? FirstCell else {fatalError()}
        
        if isFiltering{
            cell.configure(info: filtredCharacters![indexPath.row])
            cell.configureName(info: filtredCharacters![indexPath.row])
        }else{
            switch statment{
            case .normal:
                cell.configure(info: presenter.charArr[indexPath.row])
                cell.configureName(info: presenter.charArr[indexPath.row])
            case .woomen:
                cell.configure(info: presenter.woomenCharacter![indexPath.row])
                cell.configureName(info: presenter.woomenCharacter![indexPath.row])
            case .man:
                cell.configure(info: presenter.menCharacter![indexPath.row])
                cell.configureName(info: presenter.menCharacter![indexPath.row])
            }
        }
        
        return cell
    }
}
extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var location = ""
        
        switch statment{
        case .normal:
            location = presenter.charArr[indexPath.item].location.name
        case .woomen:
            location = presenter.woomenCharacter![indexPath.item].location.name
        case .man:
            location = presenter.menCharacter![indexPath.item].location.name
        }
        presenter.tapOnCell(location: location)
        
        
    }
    
}
extension ViewController{
    @objc func sortWoomen(){
        statment = .woomen
        collectionView.reloadData()
        UIView.animate(withDuration: 3){
            self.layout.collectionView?.layoutIfNeeded()
        }
    }
}
extension ViewController{
    @objc func sortMen(){
        statment = .man
        collectionView.reloadData()
        UIView.animate(withDuration: 3){
            self.layout.collectionView?.layoutIfNeeded()
        }
    }
}
extension ViewController{
    @objc func sortBase(){
        statment = .normal
        collectionView.reloadData()
        UIView.animate(withDuration: 3){
            self.layout.collectionView?.layoutIfNeeded()
        }
    }
}
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterCharacter(text: search.searchBar.text!)
    }
    
    private func filterCharacter(text: String){
        filtredCharacters = presenter.charArr.filter({ (arr: Character2) in
            return arr.name.lowercased().contains(text.lowercased())
        })
        
        collectionView.reloadData()
    }
}


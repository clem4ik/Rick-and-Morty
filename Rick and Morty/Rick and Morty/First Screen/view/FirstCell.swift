import UIKit
import Alamofire

class FirstCell: UICollectionViewCell {
    private let image: UIImageView = {
        var image = UIImageView()
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let characterName: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let characterGender: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backView: UIView = {
       var view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setView()
        setImageOnView()
        setName()
        setGender()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
        contentView.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setImageOnView(){
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    func setName(){
        contentView.addSubview(characterName)
        NSLayoutConstraint.activate([
            characterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 300),
            characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    func setGender(){
        contentView.addSubview(characterGender)
        NSLayoutConstraint.activate([
            characterGender.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 300),
            characterGender.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 300),
            characterGender.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterGender.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(info: Character2){
        
        let imageUrl = URL(string: info.image)!
        
        let globalQue = DispatchQueue.global(qos: .utility)
        
        globalQue.async {
            guard let data = try? Data(contentsOf: imageUrl) else{return}
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data)
                self.characterName.text = info.name
            }
        }
    }
    func configureName(info: Character2){
        let globalQue = DispatchQueue.global(qos: .utility)
        
        globalQue.async {
            DispatchQueue.main.async {
                self.characterName.text = info.name
                self.characterGender.text = info.gender.gender
            }
        }
    }
}

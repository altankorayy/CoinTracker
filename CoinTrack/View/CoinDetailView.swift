//
//  CoinDetailView.swift
//  CoinTrack
//
//  Created by Altan on 7.10.2023.
//

import UIKit

class CoinDetailView: UIViewController {
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let assetImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 48/255, green: 20/255, blue: 160/255, alpha: 1)
        
        view.addSubview(idLabel)
        view.addSubview(nameLabel)
        view.addSubview(symbolLabel)
        view.addSubview(assetImageView)
        view.addSubview(priceLabel)
        view.addSubview(rankLabel)
        view.addSubview(scoreLabel)
        
        configureConstraints()
    }
    
    func update(with cryptos: [Item], indexPath: Int) {
        guard let image = cryptos[indexPath].large else { return }
        guard let url = URL(string: image) else { return }
        guard let price = cryptos[indexPath].price_btc else { return }
        guard let rank = cryptos[indexPath].market_cap_rank else { return }
        assetImageView.sd_setImage(with: url)
        nameLabel.text = cryptos[indexPath].name
        symbolLabel.text = cryptos[indexPath].symbol
        priceLabel.text = "Price: \(price) BTC"
        rankLabel.text = "MarketCap Rank: \(rank)"
        scoreLabel.text = "Score: \(cryptos[indexPath].score)"
        idLabel.text = "ID: \(cryptos[indexPath].id)"
    }
    
    private func configureConstraints() {
        let assetImageViewConstraints = [
            assetImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            assetImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            assetImageView.heightAnchor.constraint(equalToConstant: 100),
            assetImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let nameLabelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: assetImageView.trailingAnchor, constant: 20)
        ]
        
        let symbolLabelConstraints = [
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            symbolLabel.leadingAnchor.constraint(equalTo: assetImageView.trailingAnchor, constant: 20)
        ]
        
        let priceLabelConstraints = [
            priceLabel.topAnchor.constraint(equalTo: assetImageView.bottomAnchor, constant: 80),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        let rankLabelConstraints = [
            rankLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30),
            rankLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        let scoreLabelConstraints = [
            scoreLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: 30),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        let idLabelConstraints = [
            idLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 30),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        NSLayoutConstraint.activate(assetImageViewConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(symbolLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
        NSLayoutConstraint.activate(rankLabelConstraints)
        NSLayoutConstraint.activate(scoreLabelConstraints)
        NSLayoutConstraint.activate(idLabelConstraints)
    }
    
}

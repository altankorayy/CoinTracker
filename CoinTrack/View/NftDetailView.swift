//
//  NftDetailView.swift
//  CoinTrack
//
//  Created by Altan on 7.10.2023.
//

import UIKit

class NftDetailView: UIViewController {
    
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
    
    private let contractIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let currencySymbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let changePriceLabel: UILabel = {
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
        view.addSubview(contractIdLabel)
        view.addSubview(changePriceLabel)
        view.addSubview(currencySymbolLabel)
        
        configureConstraints()
    }
    
    func update(with nfts: [Nft], indexPath: Int) {
        let image = nfts[indexPath].thumb
        guard let url = URL(string: image) else { return }
        let price = nfts[indexPath].floor_price_in_native_currency
        assetImageView.sd_setImage(with: url)
        nameLabel.text = nfts[indexPath].name
        symbolLabel.text = nfts[indexPath].symbol
        priceLabel.text = "Price: \(price) \(nfts[indexPath].native_currency_symbol)"
        changePriceLabel.text = "24 hours change: \(nfts[indexPath].floor_price_24h_percentage_change)"
        currencySymbolLabel.text = "Currency: \(nfts[indexPath].native_currency_symbol)"
        contractIdLabel.text = "Contract ID: \(nfts[indexPath].nft_contract_id)"
        idLabel.text = "ID: \(nfts[indexPath].id)"
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
        
        let changePriceLabelConstraints = [
            changePriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30),
            changePriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        let currencySymbolLabelConstraints = [
            currencySymbolLabel.topAnchor.constraint(equalTo: changePriceLabel.bottomAnchor, constant: 30),
            currencySymbolLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        let contractIdLabelConstraints = [
            contractIdLabel.topAnchor.constraint(equalTo: currencySymbolLabel.bottomAnchor, constant: 30),
            contractIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        let idLabelConstraints = [
            idLabel.topAnchor.constraint(equalTo: contractIdLabel.bottomAnchor, constant: 30),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ]
        
        NSLayoutConstraint.activate(assetImageViewConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(symbolLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
        NSLayoutConstraint.activate(changePriceLabelConstraints)
        NSLayoutConstraint.activate(currencySymbolLabelConstraints)
        NSLayoutConstraint.activate(contractIdLabelConstraints)
        NSLayoutConstraint.activate(idLabelConstraints)
    }

}

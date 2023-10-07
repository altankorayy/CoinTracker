//
//  ExploreTableViewCell.swift
//  CoinTrack
//
//  Created by Altan on 2.10.2023.
//

import UIKit
import SDWebImage

class ExploreTableViewCell: UITableViewCell {

    static let identifier = "ExploreTableViewCell"
    
    private let assetImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .green
        return label
    }()

    private let volumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(assetImage)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(volumeLabel)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        let assetImageConstraints = [
            assetImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            assetImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            assetImage.widthAnchor.constraint(equalToConstant: 50),
            assetImage.heightAnchor.constraint(equalToConstant: 50)
        ]

        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: assetImage.trailingAnchor, constant: 15)
        ]

        let priceLabelConstraints = [
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20)
        ]

        NSLayoutConstraint.activate(assetImageConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(priceLabelConstraints)
    }
    
    func update(with cryptos: [Item], indexPath: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = cryptos[indexPath].symbol
            guard let price = cryptos[indexPath].price_btc else { return }
            self?.priceLabel.text = "\(price) BTC"
            guard let imageUrl = cryptos[indexPath].large else { return }
            self?.assetImage.sd_setImage(with: URL(string: imageUrl))
        }
    }
    
    func updateWithNfts(with nft: [Nft], indexPath: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = nft[indexPath].symbol
            let price = nft[indexPath].floor_price_in_native_currency
            self?.priceLabel.text = "\(price) ETH"
            let imageUrl = nft[indexPath].thumb
            self?.assetImage.sd_setImage(with: URL(string: imageUrl))
        }
    }
}

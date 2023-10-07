//
//  ExploreView.swift
//  CoinTrack
//
//  Created by Altan on 30.09.2023.
//

import Foundation
import UIKit

// -> Presenter

protocol AnyView {
    var presenter: AnyPresenter? {get set}
    
    func update(with cryptos: [Item])
    func updateNft(with nft: [Nft])
    func updateError(with error: String)
}

enum Sections: Int {
    case trendingCoins = 0
    case popularNfts = 1
}

class ExploreViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    var cryptoList = [Item]()
    var nftList = [Nft]()
    let sectionTitles = ["🔥 Trending Coins", "🚨 Popular NFTs"]
    
    private let exploreTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ExploreTableViewCell.self, forCellReuseIdentifier: ExploreTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 48/255, green: 20/255, blue: 160/255, alpha: 1)
        view.addSubview(exploreTableView)
        
        exploreTableView.delegate = self
        exploreTableView.dataSource = self
        
        exploreTableView.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        exploreTableView.frame = view.bounds
    }
    
    func update(with cryptos: [Item]) {
        cryptoList = cryptos
        DispatchQueue.main.async { [weak self] in
            self?.exploreTableView.reloadData()
        }
    }
    
    func updateNft(with nft: [Nft]) {
        nftList = nft
        DispatchQueue.main.async { [weak self] in
            self?.exploreTableView.reloadData()
        }
    }
    
    func updateError(with error: String) {
        print(error)
    }
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Sections.trendingCoins.rawValue:
            return cryptoList.count
        case Sections.popularNfts.rawValue:
            return nftList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExploreTableViewCell.identifier, for: indexPath) as? ExploreTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.section {
        case Sections.trendingCoins.rawValue:
            cell.update(with: self.cryptoList, indexPath: indexPath.row)
        case Sections.popularNfts.rawValue:
            cell.updateWithNfts(with: self.nftList, indexPath: indexPath.row)
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case Sections.trendingCoins.rawValue:
            let detailVC = CoinDetailView()
            detailVC.update(with: cryptoList, indexPath: indexPath.row)
            detailVC.modalTransitionStyle = .flipHorizontal
            present(detailVC, animated: true, completion: nil)
        case Sections.popularNfts.rawValue:
            let detailVC = NftDetailView()
            detailVC.update(with: nftList, indexPath: indexPath.row)
            detailVC.modalTransitionStyle = .flipHorizontal
            present(detailVC, animated: true, completion: nil)
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }

        header.backgroundView?.backgroundColor = UIColor.clear
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        header.textLabel?.textColor = .white
    }

}

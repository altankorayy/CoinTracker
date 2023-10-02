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
    
    func update(with cryptos: [CryptoItems])
    func updateError(with error: String)
}

class ExploreViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    var cryptoList = [CryptoItems]()
    
    private let exploreTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExploreTableViewCell.self, forCellReuseIdentifier: ExploreTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(exploreTableView)
        
        exploreTableView.delegate = self
        exploreTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        exploreTableView.frame = view.bounds
    }
    
    func update(with cryptos: [CryptoItems]) {
        cryptoList = cryptos
        DispatchQueue.main.async { [weak self] in
            self?.exploreTableView.reloadData()
        }
    }
    
    func updateError(with error: String) {
        print(error)
    }
    
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExploreTableViewCell.identifier, for: indexPath) as? ExploreTableViewCell else {
            return UITableViewCell()
        }
        cell.update(with: self.cryptoList, indexPath: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

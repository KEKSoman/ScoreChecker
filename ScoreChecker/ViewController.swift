//
//  ViewController.swift
//  ScoreChecker
//
//  Created by Евгений колесников on 08.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let cell = "PlayerCell"
    var players: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список участников"
        
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addPlayer))
        navigationItem.rightBarButtonItem = addButton
        tableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
    }
    
    @objc private func addPlayer() {
        
        let alert = UIAlertController(title: "Введите имя участника", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Пиши сюда имя"
        }
        let saveAlertButton = UIAlertAction(title: "Добавить", style: .default) { action in
            let tf = alert.textFields![0] as UITextField
            guard let playerName = tf.text,
                  playerName.count > 0 else { return }
            self.players.append(playerName)
            print("Player array: \(self.players)")
            self.tableView.reloadData()
        }
        alert.addAction(saveAlertButton)
        self.present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(players.count)
        return players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? PlayerCell else { return }
        
        cell.playerName.text = players[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

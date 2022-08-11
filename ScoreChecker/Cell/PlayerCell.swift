//
//  PlayerCell.swift
//  ScoreChecker
//
//  Created by Евгений колесников on 08.06.2022.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var plusScoreButton: UIButton!
    
    var buttonAction: (()-> ())?
    var scoreValue = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        scoreLabel.text = String(scoreValue)
        plusScoreButton.addTarget(self, action: #selector(plusScore), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusScore), for: .touchUpInside)
    }
    @objc private func plusScore() {
        scoreValue += 1
        scoreLabel.text = String(scoreValue)
    }
    @objc private func minusScore() {
        if scoreValue > 0 {
            scoreValue -= 1
            scoreLabel.text = String(scoreValue)
        }
    }
}

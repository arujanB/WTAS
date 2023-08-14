//
//  NotificationTableViewCell.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 14.08.2023.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    static let IDENTIFIER = "NotificationTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

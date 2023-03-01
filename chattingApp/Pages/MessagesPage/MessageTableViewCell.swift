//
//  MessageTableViewCell.swift
//  chattingApp
//
//  Created by MacBook on 28.02.2023.
//

import UIKit

class MessageTableViewCell : UITableViewCell {
    
    private lazy var cardView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .ChatAppColor.purple100
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var messageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Trying"
        label.textColor = .white
        return label
    }()
    
    private lazy var messageSender : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .ChatAppColor.blue100
        label.layer.cornerRadius = 20
        label.textAlignment = .center
        label.text = "Me"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardView.addSubview(messageLabel)
        messageLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        
        //messageSender.layer.cornerRadius = 10
        contentView.addSubview(messageSender)
        messageSender.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        messageSender.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        messageSender.widthAnchor.constraint(equalToConstant: 70).isActive = true
        messageSender.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(message : Message) {
        messageLabel.text = message.body
        messageSender.text = message.sender
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

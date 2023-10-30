//
//  ChatListViewController.swift
//  ChatList_Moon
//
//  Created by 이문정 on 2023/10/30.
//

import UIKit

class ChatListViewController: UIViewController {
    
    var chatList: [Chat] = Chat.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        chatList = chatList.sorted(by: {$0.date > $1.date})
        chatList = chatList.sorted(by: { chat0, chat1 in
            return chat0.date > chat1.date
        })
        
    }
}

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Chat.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChetListCollectionViewCell", for: indexPath) as? ChetListCollectionViewCell else { return UICollectionViewCell() }
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}

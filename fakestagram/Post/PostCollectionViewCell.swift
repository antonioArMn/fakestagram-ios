//
//  PostCollectionViewCell.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier  = "postViewCell"
    public var post: Post? {
        didSet { updateView() }
    }
    
    //private var like = false
    //private let likeClient = LikeClient(postId: Int)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorView: PostAuthorView!
    @IBOutlet weak var titleLbl: UITextView!
    @IBOutlet weak var likesCountLbl: UILabel!
    @IBOutlet weak var commentsCountLbl: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    private func updateView() {
        guard let post = self.post else { return }
        post.load { [weak self] img in
            self?.imageView.image = img
        }
        authorView.author = post.author
        titleLbl.text = post.title
        likesCountLbl.text = "\(post.likesCount) likes"
        commentsCountLbl.text = "\(post.commentsCount) comments"
        if post.liked {
            likeBtn.titleLabel?.text = "Unlike"
        } else {
            likeBtn.titleLabel?.text = "Like"
        }
    }
    @IBAction func tapLike(_ sender: Any) {
        likeUpdateView()
        //print("\(post.title) - \(like)")
    }
    
    func likeUpdateView() {
        guard var post = self.post else { return } //Si no tiene post, no hagas nada (return)
        post.liked = !post.liked
        if post.liked {
            post.likesCount = post.likesCount + 1
        } else {
            post.likesCount = post.likesCount - 1
        }
        self.post = post
    }
    
    func client() -> LikeClient? {
        guard let post = self.post , let postId = post.id else { return nil }
    }
    
}

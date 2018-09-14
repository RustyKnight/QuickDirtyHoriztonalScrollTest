//
//  TestScrollView.swift
//  TestScrolly
//
//  Created by Shane Whitehead on 14/9/18.
//  Copyright © 2018 Shane Whitehead. All rights reserved.
//

import UIKit
import PureLayout

class TestScrollView: UIScrollView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	// This is the primary content view, constrained
	// to the edges of the scroll view
	var contentView: UIView!
	// This view is where the actual content is added
	// and is also constrainted to the middle
	// of the content view
	var centerView: UIView!
	
	func commonInit() {
		backgroundColor = .orange
		configureForAutoLayout()
		contentView = UIView()
		contentView.configureForAutoLayout()
		contentView.backgroundColor = .blue
		super.addSubview(contentView)
		
		contentView.autoPinEdge(toSuperviewEdge: .top)
		contentView.autoPinEdge(toSuperviewEdge: .bottom)
		contentView.autoPinEdge(toSuperviewEdge: .leading)
		contentView.autoMatch(.width, to: .width, of: self).priority = UILayoutPriority(250)
		contentView.autoMatch(.height, to: .height, of: self)
		// Allow the trailing edge to grow
		contentView.autoPinEdge(toSuperviewEdge: .trailing).priority = UILayoutPriority(250)
		
		centerView = UIView()
		centerView.configureForAutoLayout()
		centerView.backgroundColor = .yellow
		contentView.addSubview(centerView)
		centerView.autoCenterInSuperview()
		
		centerView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0, relation: .greaterThanOrEqual)
		centerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10, relation: .greaterThanOrEqual)
	}
	
	var lastView: UIView?
	var trailingEdgeConstraint: NSLayoutConstraint?
	
	func addTo(_ view: UIView) {
		centerView.addSubview(view)
		if let lastView = lastView {
			trailingEdgeConstraint?.autoRemove()
			view.autoPinEdge(.leading, to: .trailing, of: lastView, withOffset: 8)
		} else {
			view.autoPinEdge(toSuperviewEdge: .leading)
		}
		trailingEdgeConstraint = view.autoPinEdge(toSuperviewEdge: .trailing)
		view.autoPinEdge(toSuperviewEdge: .top)
		view.autoPinEdge(toSuperviewEdge: .bottom)
		view.autoSetDimension(.width, toSize: 100)
		self.lastView = view
		
		setNeedsLayout()
		layoutIfNeeded()
	}
	
}

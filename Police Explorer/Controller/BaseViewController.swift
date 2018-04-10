//
//  BaseViewController.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import UIKit


/// Generic base view controller that automatically loads the underlying `BaseView` of type `T`.
open class BaseViewController<T : UIView>: UIViewController {


    // MARK: - Properties

    open var underlyingView: T {
        if let myView = view as? T {
            return myView
        }

        let newView = T()
        view = newView
        return newView
    }


    // MARK: - Initializers

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - View Lifecycle

    open override func loadView() {
        view = T()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupAccessibility()
    }


    // MARK: - Setup

    // Abstract method. Subclasses should override this method to setup their view.
    open func setupView() {

    }

    // Abstract method. Subclasses should override this method to add accessibility.
    open func setupAccessibility() {

    }

}

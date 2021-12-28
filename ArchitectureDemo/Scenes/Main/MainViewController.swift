//
//  MainViewController.swift
//  ArchitectureDemo
//
//  Created by Ngô Minh Tuấn on 27/12/2021.
//

import UIKit
import MGArchitecture
import RxSwift
import RxCocoa
import Reusable
import Then

final class MainViewController: UIViewController, Bindable {

    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    @IBOutlet weak var productListButton: UIButton!
    var viewModel: MainViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        title = "Main"
    }

    func bindViewModel() {
        print("aa")
        let input = MainViewModel.Input(load: Driver.just(()),
            toProductListTrigger: productListButton.rx.tap.asDriver()
        )

        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension MainViewController {
    
}

// MARK: - StoryboardSceneBased
extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}

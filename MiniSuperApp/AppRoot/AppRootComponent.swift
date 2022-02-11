//
//  AppRootComponent.swift
//  MiniSuperApp
//
//  Created by SEUNGHA on 2022/02/09.
//

import Foundation
import ModernRIBs
import AppHome
import FinanceHome
import ProfileHome
import FinanceRepository
import TransportHome
import TransportHomeImp
import Topup
import TopupImp
import AddPaymentMethod
import AddPaymentMethodImp

final class AppRootComponent: Component<AppRootDependency>,
                              AppHomeDependency,
                              FinanceHomeDependency,
                              ProfileHomeDependency,
                              TransportHomeDependency,
                              TopupDependency,
                              AddPaymentMethodDependency {
    var cardsOnFileRepository: CardOnFileRepository
    var superPayRepository: SuperPayRepository
    var topupBaseViewController: ViewControllable { rootViewController.topViewControllable }
    
    private let rootViewController: ViewControllable
    
    lazy var transportHomeBuildable: TransportHomeBuildable = {
        return TransportHomeBuilder(dependency: self)
    }()
    
    lazy var topupBuildable: TopupBuildable = {
        return TopupBuilder(dependency: self)
    }()
    
    lazy var addPaymentMethodBuildable: AddPaymentMethodBuildable = {
        return AddPaymentMethodBuilder(dependency: self)
    }()
    
    init(
        dependency: AppRootDependency,
        cardsOnFileRepository: CardOnFileRepository,
        superPayRepository: SuperPayRepository,
        rootViewController: ViewControllable
    ) {
        self.cardsOnFileRepository = cardsOnFileRepository
        self.superPayRepository = superPayRepository
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}
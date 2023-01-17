//
//  UpdateUseCase.swift
//  ProjectManager
//
//  Created by ayaan, jpush on 2023/01/17.
//

import RxSwift

final class UpdateUseCase {
    private weak var delegate: DidEndUpdatingDelegate?
    private let repository: TaskRepository

    private let translater = Translater()
    private let disposeBag = DisposeBag()
    let isUpdatedSuccess = PublishSubject<Bool>()

    init(delegate: DidEndUpdatingDelegate, repository: TaskRepository) {
        self.delegate = delegate
        self.repository = repository
    }

    func update(_ task: Task) {
        guard let entity = translater.toEntity(with: task) else {
            return isUpdatedSuccess.onNext(false)
        }

        repository.update(entity)
            .subscribe(onNext: { [weak self] isSuccess in
                if isSuccess {
                    self?.delegate?.didEndUpdating(task: task)
                }

                self?.isUpdatedSuccess.onNext(isSuccess)
            })
            .disposed(by: disposeBag)
    }
}

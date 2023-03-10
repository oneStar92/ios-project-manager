//
//  DefaultDeleteTaskUseCase.swift
//  ProjectManager
//
//  Created by ayaan, jpush on 2023/01/17.
//

import RxSwift

protocol DeleteTaskUseCase {
    var isDeletedSuccess: PublishSubject<Bool> { get }
    
    func delete(_ task: Task)
}

final class DefaultDeleteTaskUseCase: DeleteTaskUseCase {
    private weak var delegate: DidEndDeletingDelegate?
    private let repository: TaskRepository
    
    private let translater = Translater()
    private let disposeBag = DisposeBag()
    let isDeletedSuccess = PublishSubject<Bool>()
    
    init(delegate: DidEndDeletingDelegate? = nil, repository: TaskRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func delete(_ task: Task) {
        let entity = translater.toEntity(with: task)
        
        repository.delete(entity)
            .subscribe(onNext: { [weak self] isSuccess in
                if isSuccess {
                    self?.delegate?.didEndDeleting(task: task)
                }
                self?.isDeletedSuccess.onNext(isSuccess)
            })
            .disposed(by: disposeBag)
    }
}

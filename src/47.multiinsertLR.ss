(define consL
    (lambda (new l)
        (con new l)
    )
)

(define consR
    (lambda (new l)
        (cons (car l) (cons new (cdr l)))
    )
)

(define multiinsertLR
    (lambda (new oldL oldR lat)
        (cond
            ((null? l) l)
            ((eq? (car l) oldL) (consL new (multiinsertLR new oldL oldR (cdr l))))
            ((eq? (car l) oldR) (consR new (multiinsertLR new oldL oldR (cdr l))))
            (else (cons (car l) (multiinsertLR new oldL oldR (cdr l))))
        )
    )
)
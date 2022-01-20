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

(define insert-g
    (lambda (test? mycons)
        (lambda (new old l)
            (cond
                ((null? l) l)
                ((test? (car l) old) (mycons new l))
                (else (cons (car l) ((insertL-f test?) new old (cdr l))))
            )
        )
    )
)
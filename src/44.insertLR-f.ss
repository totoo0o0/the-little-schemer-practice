(define insertL-f
    (lambda (test?)
        (lambda (new old l)
            (cond
                ((null? l) l)
                ((test? (car l) old) (cons new l))
                (else (cons (car l) ((insertL-f test?) new old (cdr l))))
            )
        )
    )
)

(define insertR-f
    (lambda (test?)
        (lambda (new old l)
            (cond
                ((null? l) l)
                ((test? (car l) old) (cons (car l) (cons (new (cdr l)))))
                (else (cons (car l) ((insertR-f test?) new old (cdr l))))
            )
        )
    )
)
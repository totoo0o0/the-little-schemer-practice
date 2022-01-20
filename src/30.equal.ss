(define equal?
    (lambda (s1 s2)
        (cond
            ((atom? s1) (and (atom? s2) (eq? s1 s2)))
            ((atom? s2) #f)
            ((eq? (null? s1) (null? s2)) (and (equal? (car s1) (car s2)) (equal? (cdr s1) (cdr s2))))
            (else #f)
        )
    )
)
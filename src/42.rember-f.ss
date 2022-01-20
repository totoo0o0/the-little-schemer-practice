(define rember-f
    (lambda (test? a l)
        (cond
            ((null? l) l)
            ((test? a (car l)) (cdr l))
            (else (cons (car l) (rember-f test? a (cdr l))))
        )
    )
)

(display (rember-f eq? 5 `(6 2 5 3)))
(newline)
(display (rember-f eq? `jelly `(jelly beans are good)))
(newline)

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
(display (rember-f equal? `(pop corn) `(lemonade (pop corn) and (cake))))
(newline)
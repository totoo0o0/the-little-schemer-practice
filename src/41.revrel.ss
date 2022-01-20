(define first
    (lambda (p)
        (car p)
    )
)

(define second
    (lambda (p)
        (car (cdr p))
    )
)

(define build
    (lambda (s1 s2)
        (cons s1 (cons s2 `()))
    )
)

(define revrel
    (lambda (rel)
        (cond
            ((null? rel) rel)
            (else (cons (build (second (car rel)) (first (car rel))) (revrel (cdr rel))))
        )
    )
)

(display (revrel `((8 a) (pumpkin pie) (got sick))))
(newline)

(define revpair
    (lambda (pair)
        (build (second pair) (first pair))
    )
)

(define revrel
    (lambda (rel)
        (cond
            ((null? rel) rel)
            (else (cons (revpair (car rel)) (revrel (cdr rel))))
        )
    )
)

(display (revrel `((8 a) (pumpkin pie) (got sick))))
(newline)
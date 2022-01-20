(define tup+
    (lambda (tup1 tup2)
        (cond
            ((null? tup1) tup2)
            ((null? tup2) tup1)
            (else (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2))))
        )
    )
)

(display (tup+ `(2 3 3) `(4 6 6 6)))
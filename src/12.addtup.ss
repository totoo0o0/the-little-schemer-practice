(define addtup
    (lambda (tup)
        (cond
            ((null? tup) 0)
            (else (+ (car tup) (addtup (cdr tup))))
        )
    )
)

(display (addtup `(3 5 2 8)))
(newline)
(display (addtup `(15 6 7 12 3)))
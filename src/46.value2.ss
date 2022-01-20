(define ^
    (lambda (n m)
        (cond
            ((zero? m) 1)
            (else (* n (^ n (- m 1))))
        )
    )
)

(define atom-to-func
    (lambda (symbol)
        (cond
            ((eq? symbol `+) +)
            ((eq? symbol `-) -)
            ((eq? symbol `*) *)
            ((eq? symbol `/) /)
            (else ^)
        )
    )
)

(define value
    (lambda (nexp)
        (cond
            ((atom? nexp) nexp)
            (else (
                (atom-to-func (car (cdr nexp)))
                    (value (car nexp))
                    (value (car (cdr (cdr nexp))))))
        )
    )
)

(display (value 13))
(newline)
(display (value `(1 + 3)))
(newline)
(display (value `(1 + (3 ^ 4))))
(newline)
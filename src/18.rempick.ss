(define rempick
    (lambda (n lat)
        (cond
            ((< n 1) `())
            ((eq? n 1) (cdr lat))
            (else (cons (car lat) (rempick (- n 1) (cdr lat))))
        )
    )
)

(display (rempick 3 `(hotdogs with hot mustard)))
(newline)

(define one?
    (lambda (n)
        (= n 1)
    )
)

(define rempick2
    (lambda (n lat)
        (cond
            ((< n 1) `())
            ((one? n) (cdr lat))
            (else (cons (car lat) (rempick2 (- n 1) (cdr lat))))
        )
    )
)

(display (rempick 3 `(hotdogs with hot mustard)))
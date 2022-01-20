(define multirember
    (lambda (a lat)
        (cond
            ((null? lat) lat)
            ((eq? (car lat) a) (multirember a (cdr lat)))
            (else (cons (car lat) (multirember a (cdr lat))))
        )
    )
)

(put-datum (current-output-port) (multirember `cup `(coffee cup tea cup and hick cup)))
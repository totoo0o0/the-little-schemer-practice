(define all-nums
    (lambda (lat)
        (cond
            ((null? lat) lat)
            ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
            (else (all-nums (cdr lat)))
        )
    )
)

(display (all-nums `(5 pears 6 prunes 9 dates)))
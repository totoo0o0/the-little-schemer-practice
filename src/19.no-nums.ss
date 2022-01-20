(define no-nums
    (lambda (lat)
        (cond
            ((null? lat) lat)
            ((number? (car lat)) (no-nums (cdr lat)))
            (else (cons (car lat) (no-nums (cdr lat))))
        )
    )
)

(display (no-nums `(5 pears 6 prunes 9 dates)))
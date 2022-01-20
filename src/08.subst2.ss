(define subst2
    (lambda (new o1 o2 lat)
        (cond
            ((null? lat) lat)
            ((or (eq? o1 (car lat)) (eq? o2 (car lat))) (cons new (cdr lat)))
            (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))
        )
    )
)

(put-datum (current-output-port) (subst2 `vanilla `chocolate `banana `(banana ice cream with chocolate topping)))
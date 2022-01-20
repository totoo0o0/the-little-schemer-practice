(define subst
    (lambda (new old lat)
        (cond
            ((null? lat) lat)
            ((eq? old (car lat)) (cons new (cdr lat)))
            (else (cons (car lat) (subst new old (cdr lat))))
        )
    )
)

(put-datum (current-output-port) (subst `e `d `(a b c d f g d h)))
(put-datum (current-output-port) (subst `topping `fudge `(ice cream with fudge for dessert)))
(put-datum (current-output-port) (subst `jalapeno `and `(tacos tamales and salsa)))
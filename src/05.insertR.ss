(define insertR
    (lambda (new old lat)
        (cond
            ((null? lat) lat)
            ((eq? old (car lat)) (cons (car lat) (cons new (cdr lat))))
            (else (cons (car lat) (insertR new old (cdr lat))))
        )
    )
)

(put-datum (current-output-port) (insertR `e `d `(a b c d f g d h)))
(put-datum (current-output-port) (insertR `topping `fudge `(ice cream with fudge for dessert)))
(put-datum (current-output-port) (insertR `jalapeno `and `(tacos tamales and salsa)))
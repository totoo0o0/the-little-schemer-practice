(define insertL
    (lambda (new old lat)
        (cond
            ((null? lat) lat)
            ((eq? old (car lat)) (cons new lat))
            (else (cons (car lat) (insertL new old (cdr lat))))
        )
    )
)

(put-datum (current-output-port) (insertL `e `d `(a b c d f g d h)))
(put-datum (current-output-port) (insertL `topping `fudge `(ice cream with fudge for dessert)))
(put-datum (current-output-port) (insertL `jalapeno `and `(tacos tamales and salsa)))
(define rember
    (lambda (a lat)
        (cond
            ((null? lat) lat)
            ((eq? a (car lat)) (cdr lat))
            (else (cons (car lat) (rember a (cdr lat))))
        )
    )
)

(put-datum (current-output-port) (rember `mint `(lamb chops and mint jelly)))
(put-datum (current-output-port) (rember `mint `(lamb chops and mint flavored mint jelly)))
(put-datum (current-output-port) (rember `toast `(bacon lettuce and tomato)))
(put-datum (current-output-port) (rember `cup `(coffee cup tea cup and hick cup)))
(put-datum (current-output-port) (rember `sauce `(soy sauce and tomato sauce)))
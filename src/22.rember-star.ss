(define rember*
    (lambda (a l)
        (cond
            ((null? l) l)
            ((eq? (car l) a) (rember* a (cdr l)))
            (else (cons (
                cond ((atom? (car l)) (car l))
                    (else (rember* a (car l))))
                (rember* a (cdr l))))
        )
    )
)

(display (rember* `cup `((coffee) cup ((tea) cup) (and (hick)) cup)))
(newline)
(display (rember* `sauce `(((tomato sauce)) ((bean) sauce) (and ((flying)) sauce))))
(newline)
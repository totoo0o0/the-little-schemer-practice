(define member?
    (lambda (a l)
      (cond
        ((null? l) #f)
        ((eq? a (car l)) #t)
        (else (member? a (cdr l))))))
(define makeset
    (lambda (lat)
        (cond
            ((null? lat) lat)
            ((member? (car lat) (cdr lat)) (makeset (cdr lat)))
            (else (cons (car lat) (makeset (cdr lat))))
        )
    )
)
(display (makeset `(apple peach pear peach plum apple lemon peach)))
(newline)

(define multirember
    (lambda (a lat)
        (cond
            ((null? lat) lat)
            ((eq? (car lat) a) (multirember a (cdr lat)))
            (else (cons (car lat) (multirember a (cdr lat))))
        )
    )
)
(define makeset
    (lambda (lat)
        (cond
            ((null? lat) lat)
            (else (cons (car lat) (makeset (multirember (car lat) (cdr lat)))))
        )
    )
)
(display (makeset `(apple peach pear peach plum apple lemon peach)))
(newline)
(display (makeset `(apple 3 pear 4 9 apple 3 4)))
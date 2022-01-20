(define leftmost
    (lambda (l)
        (cond
            ((atom? (car l)) (car l))
            (else (leftmost (car l)))
        )
    )
)

(display (leftmost `((potato) (chips ((with) fish) (chips)))))
(newline)
(display (leftmost `(((hot) (tuna (and))) cheese)))
(newline)
(display (leftmost `(((() four)) 17 (seventeen))))
(newline)
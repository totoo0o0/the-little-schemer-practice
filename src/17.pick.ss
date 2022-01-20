(define pick
    (lambda (n lat)
        (cond
            ((< n 1) `())
            ((eq? n 1) (car lat))
            (else (pick (- n 1) (cdr lat)))
        )
    )
)

(display (pick 4 `(lasagna spaghetti ravioli macaroni meatball)))
(newline)
(display (pick 0 `(lasagna spaghetti ravioli macaroni meatball)))
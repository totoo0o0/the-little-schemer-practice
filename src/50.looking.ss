(define pick
    (lambda (pos lat)
        (cond
            ((eq? pos 1) (car lat))
            (else (pick (- pos 1) (cdr lat)))
        )
    )
)

(display (pick 6 `(6 2 4 caviar 5 7 3)))
(newline)
(display (pick 7 `(6 2 4 caviar 5 7 3)))
(newline)

(define keep-looking
    (lambda (a sorn lat)
        (cond
            ((number? sorn) (keep-looking a (pick sorn lat) lat))
            (else (eq? sorn a))
        )))

(display (keep-looking `caviar 3 `(6 2 4 caviar 5 7 3)))
(newline)

(define looking
    (lambda (a lat)
        (keep-looking a 1 lat)
    )
)

(display (looking `caviar `(6 2 4 caviar 5 7 3)))
(newline)
(display (looking `caviar `(6 2 grits caviar 5 7 3)))
(newline)
(define length
    (lambda (lat)
        (cond
            ((null? lat) 0)
            (else (+ (length (cdr lat)) 1))
        )
    )
)

(display (length `(hotdogs with mustard sauerkraut and pickles)))
(define ^
    (lambda (n m)
        (cond
            ((zero? m) 1)
            (else (* n (^ n (- m 1))))
        )
    )
)

(display (^ 5 3))
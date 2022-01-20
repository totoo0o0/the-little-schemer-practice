(define Y 
    (lambda (F)
        ((lambda (mk)
            (mk mk))
            (lambda (mk)
                (F (lambda (x) ((mk mk) x)))
            )
        )
    )
)

(display ((
    Y 
    (lambda (f)
        (lambda (x)
            (cond
                ((eq? 0 x) 1)
                (else (* (f (- x 1)) x)))
        )
    )
) 6))
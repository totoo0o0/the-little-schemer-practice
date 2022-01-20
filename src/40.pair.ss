(define a-pair?
    (lambda (l)
        (and (not (atom? l)) (not (null? l)) (not (null? (cdr l))) (null? (cdr (cdr l))))
    )
)

(define first
    (lambda (p)
        (car p)
    )
)

(define second
    (lambda (p)
        (car (cdr p))
    )
)

(define build
    (lambda (s1 s2)
        (cons s1 (cons s2 `()))
    )
)
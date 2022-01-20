(define occur*
    (lambda (a l)
        (cond
            ((null? l) 0)
            ((atom? (car l)) (+ (occur* a (cdr l)) (cond ((eq? (car l) a) 1) (else 0))))
            (else (+ (occur* a (car l)) (occur* a (cdr l))))
        )
    )
)

(display (occur* `banana `((banana) (split ((((banana ice))) (cream (banana)) sherbet)) (banana) (bread) (banana brandy))))
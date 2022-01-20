(define insertL*
    (lambda (new old l)
        (cond
            ((null? l) l)
            ((atom? (car l))
                (cond
                    ((eq? (car l) old) (cons new (cons (car l) (insertL* new old (cdr l)))))
                    (else (cons (car l) (insertL* new old (cdr l))))
                )
            )
            (else (cons (insertL* new old (car l)) (insertL* new old (cdr l))))
        )
    )
)

(display (insertL* `pecker `chuck `((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)))
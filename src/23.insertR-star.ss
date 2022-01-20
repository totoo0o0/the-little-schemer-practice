(define insertR*
    (lambda (new old l)
        (cond
            ((null? l) l)
            ((atom? (car l))
                (cond
                    ((eq? (car l) old) (cons (car l) (cons new (insertR* new old (cdr l)))))
                    (else (cons (car l) (insertR* new old (cdr l))))
                )
            )
            (else (cons (insertR* new old (car l)) (insertR* new old (cdr l))))
        )
    )
)

(display (insertR* `roast `chuck `((how much (wood)) could ((a (wood) chuck)) (((chuck))) (if (a) ((wood chuck))) could chuck wood)))
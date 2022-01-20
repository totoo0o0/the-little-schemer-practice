(define even?
    (lambda (x)
        (eq? (mod x 2) 0)))

(define evens-only*
    (lambda (l)
        (cond
            ((null? l) l)
            ((atom? (car l))
                (cond
                    ((even? (car l)) (cons (car l) (evens-only* (cdr l))))
                    (else (evens-only* (cdr l)))
                ))
            (else (cons (evens-only* (car l)) (evens-only* (cdr l))))
        )
    )
)

(display (evens-only* `((9 1 2 8) 3 10 ((9 9) 7 6) 2)))
(newline)

(define col-ori
    (lambda (result odd-sum even-mul)
        (cons result (cons odd-sum (cons even-mul `())))
    )
)

(define union
    (lambda (col1 col2)
        (cons 
            (cons (car col1) (car col2)) 
                (cons (+ (car (cdr col1)) (car (cdr col2)))
                    (cons (* (car (cdr (cdr col1))) (car (cdr (cdr col2)))) `())))
    )
)

(display (union `((a) 5 5) `((b (c)) 5 5)))
(newline)

(define evens-only*&co
    (lambda (l col)
        (cond
            ((null? l) (col `() 0 1))
            ((atom? (car l))
                (cond
                    ((even? (car l)) 
                        (evens-only*&co (cdr l) 
                            (lambda (result odd-sum even-mul)
                                (col (cons (car l) result) odd-sum (* even-mul (car l))))))
                    (else (evens-only*&co (cdr l)
                            (lambda (result odd-sum even-mul)
                                (col result (+ odd-sum (car l)) even-mul))))
                ))
            (else
                (evens-only*&co (car l)
                    (lambda (result1 odd-sum1 even-mul1)
                        (evens-only*&co (cdr l)
                            (lambda (result2 odd-sum2 even-mul2)
                                (col (cons result1 result2) (+ odd-sum1 odd-sum2) (* even-mul1 even-mul2)))))))
        )
    )
)

(display (evens-only*&co `((9 1 2 8) 3 10 ((9 9) 7 6) 2) col-ori))
(define member?
    (lambda (a l)
      (cond
        ((null? l) #f)
        ((eq? a (car l)) #t)
        (else (member? a (cdr l))))))

(define subset?
    (lambda (s1 s2)
        (cond
            ((null? s1) #t)
            (else (and (member? (car s1) s2) (subset? (cdr s1) s2)))
        )
    )
)
(display (subset? `(5 chicken wings) `(5 hamburgers 2 pieces fried chicken and light duckling wings)))
(newline)
(display (subset? `(4 pounds of horseradish) `(four pounds chicken and 5 ounces horseradish)))
(newline)
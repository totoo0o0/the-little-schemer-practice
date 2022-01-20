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

(define eqset?
    (lambda (set1 set2)
        (and (subset? set1 set2) (subset? set2 set1))
    )
)

(display (eqset? `(6 large chickens with wings) `(6 chickens with large wings)))
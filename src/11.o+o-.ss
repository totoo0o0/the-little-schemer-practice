(define add1
    (lambda (n)
        (+ n 1)))

(define sub1
    (lambda (n)
        (- n 1)))

(define zero?
    (lambda (n)
        (eq? n 0)))

(display (add1 1))
(newline)
(display (sub1 5))
(newline)
(display (zero? 0))
(newline)
(display (zero? 1))
(newline)

(define o+
    (lambda (a b)
        (cond
            ((zero? a) b)
            (else (o+ (sub1 a) (add1 b)))
        )
    )
)
(display (o+ 5 6))
(newline)

(define o-
    (lambda (a b)
        (cond
            ((zero? b) a)
            (else (o- (sub1 a) (sub1 b)))
        )
    )
)
(display (o- 5 7))
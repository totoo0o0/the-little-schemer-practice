(define add1
    (lambda (n)
        (+ n 1)))

(define sub1
    (lambda (n)
        (- n 1)))

(define zero?
    (lambda (n)
        (eq? n 0)))

(define >
    (lambda (n m)
        (cond
            ((zero? n) #f)
            ((zero? m) #t)
            (else (> (sub1 n) (sub1 m)))
        )
    )
)

(display (> 3 4))
(newline)
(display (> 4 3))
(newline)
(display (> 3 3))
(newline)

(define <
    (lambda (n m)
        (cond
            ((zero? m) #f)
            ((zero? n) #t)
            (else (< (sub1 n) (sub1 m)))
        )
    )
)

(display (< 3 4))
(newline)
(display (< 4 3))
(newline)
(display (< 3 3))
(newline)

(define =
    (lambda (n m)
        (cond
            ((zero? n) (zero? m))
            ((zero? m) #f)
            (else (= (sub1 n) (sub1 m)))
        )
    )
)

(display (= 3 4))
(newline)
(display (= 4 3))
(newline)
(display (= 3 3))
(newline)
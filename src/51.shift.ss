(define first
    (lambda (x)
        (car x)))
(define second
    (lambda (x)
        (car (cdr x))))

(define pair
    (lambda (l r)
        (cons l (cons r `()))))

(define shift
    (lambda (x)
        (pair (first (first x)) (pair (second (first x)) (second x)))))

(display (shift `((a b) c)))
(newline)
(display (shift `((a b) (c d))))
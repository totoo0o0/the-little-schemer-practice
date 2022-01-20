(define member?
    (lambda (a l)
      (cond
        ((null? l) #f)
        ((eq? a (car l)) #t)
        (else (member? a (cdr l))))))

(define set?
    (lambda (lat)
        (cond
            ((null? lat) #t)
            ((atom? (car lat)) (and (set? (cdr lat)) (not (member? (car lat) (cdr lat)))))
            (else #f)
        )
    )
)

(display (set? `(apple peaches apple plum)))
(newline)
(display (set? `(apples peaches pears plum)))
(newline)
(display (set? `((apples) peaches pears plum)))
(newline)
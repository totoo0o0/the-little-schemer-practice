(define member?
    (lambda (a l)
      (cond
        ((null? l) #f)
        ((eq? a (car l)) #t)
        (else (member? a (cdr l))))))

(define intersect
    (lambda (set1 set2)
        (cond
            ((null? set1) set1)
            ((member? (car set1) set2) (cons (car set1) (intersect (cdr set1) set2)))
            (else (intersect (cdr set1) set2))
        )
    )
)

(define intersectall
    (lambda (l-set)
        (cond
            ((null? (cdr l-set)) (car l-set))
            (else (intersect (car l-set) (intersectall (cdr l-set))))
        )
    )
)

(display (intersectall `((a b c) (c a d e) (e f g h a b))))
(newline)
(display (intersectall `((6 pears and) (3 peaches and 6 peppers) (8 pears and 6 plums) (and 6 prunes with som apples))))
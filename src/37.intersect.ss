(define member?
    (lambda (a l)
      (cond
        ((null? l) #f)
        ((eq? a (car l)) #t)
        (else (member? a (cdr l))))))

(define intersect?
    (lambda (set1 set2)
        (cond
            ((null? set1) #f)
            (else (or (member? (car set1) set2) (intersect? (cdr set1) set2)))
        )
    )
)

(define intersect
    (lambda (set1 set2)
        (cond
            ((null? set1) set1)
            ((member? (car set1) set2) (cons (car set1) (intersect (cdr set1) set2)))
            (else (intersect (cdr set1) set2))
        )
    )
)

(display (intersect? `(stewed tomatoes and macaroni) `(macaroni and cheese)))
(newline)
(display (intersect `(stewed tomatoes and macaroni) `(macaroni and cheese)))
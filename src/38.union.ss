(define member?
    (lambda (a l)
      (cond
        ((null? l) #f)
        ((eq? a (car l)) #t)
        (else (member? a (cdr l))))))
        
(define union
    (lambda (set1 set2)
        (cond
            ((null? set1) set2)
            ((member? (car set1) set2) (union (cdr set1) set2))
            (else (cons (car set1) (union (cdr set1) set2)))
        )
    )
)

(display (union `(stewed tomatoes and macaroni casserole) `(macaroni and cheese)))
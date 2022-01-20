(define col-base
    (lambda (result countL countR)
        (cons result (cons countL (cons countR `())))
    )
)

(define multiinsertLR&co
    (lambda (new oldL oldR lat col)
        (cond
            ((null? lat) (col `() 0 0))
            ((eq? (car lat) oldL) 
                (multiinsertLR&co new oldL oldR (cdr lat) 
                    (lambda (result countL countR)
                        (col (cons new (cons oldL result)) (+ countL 1) countR))))
            ((eq? (car lat) oldR) 
                (multiinsertLR&co new oldL oldR (cdr lat) 
                    (lambda (result countL countR)
                        (col (cons oldR (cons new result)) countL (+ countR 1)))))
            (else 
                (multiinsertLR&co new oldL oldR (cdr lat)
                    (lambda (result countL countR)
                        (col (cons (car lat) result) countL countR))))
        )
    )
)

(display (multiinsertLR&co `salty `fish `chips `(chips and fish or fish and chips) col-base))
(define member?
    (lambda (a l)
      (cond
        ((null? l) #f)
        ((eq? a (car l)) #t)
        (else (member? a (cdr l))))))

(put-datum (current-output-port) (member? 1 `(1 2 3)))
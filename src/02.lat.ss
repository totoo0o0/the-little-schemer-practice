(define lat?
    (lambda(l)
      (cond
        ((null? l) #t)
        ((atom? (car l)) (lat? (cdr l)))
        (else #f))))

(put-datum (current-output-port) (lat? `(1 `(1 2 3) 3 4 5)))
(define firsts
    (lambda (l)
        (cond
            ((null? l) (quote ()))
            (else (cons (car (car l)) (firsts (cdr l))))
        )
    )
)

(put-datum (current-output-port) (firsts `((a b) (c d) (e f))))
(put-datum (current-output-port) (firsts `((five plums) (four) (eleven green oranges))))
(put-datum (current-output-port) (firsts `(((five plums) four) (eleven green oranges) ((no) more))))
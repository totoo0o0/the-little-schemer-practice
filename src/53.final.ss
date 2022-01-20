(define first
    (lambda (lat) (car lat)))

(define second
    (lambda (lat) (car (cdr lat))))

(define pair
    (lambda (a b) (cons a (cons b `())))
)

; (display (first `(a b)))
; (newline)
; (display (second `(a b)))
; (newline)
; (display (pair `(a b) `(c d)))
; (newline)

(define lookup-in-entry
    (lambda (name entry entry-f)
        (cond
            ((or (null? (first entry)) (null? (second entry))) (entry-f name))
            ((eq? (car (first entry)) name) (car (second entry)))
            (else (lookup-in-entry 
                    name
                    (pair (cdr (first entry)) (cdr (second entry)))
                    entry-f))
        )
    )
)
; (display (lookup-in-entry `entree `((appetizer entree beverage) (food tastes good)) (lambda (name) (display name))))
; (newline)

(define extend-table cons)

(define lookup-in-table
    (lambda (name table table-f)
        (cond
            ((null? table) (table-f name))
            (else (lookup-in-entry name (car table)
                    (lambda (name) (lookup-in-table name (cdr table) table-f))
            ))
        )
    )
)

(define expression-to-action
    (lambda (e)
        (cond
            ((atom? e) (atom-to-action e))
            (else (list-to-action e))
        )
    )
)

(define *null
    (lambda (e table)
        `())
)

(define atom-to-action
    (lambda (e)
        (cond
            ((null? e) *null)
            ((number? e) *const)
            ((eq? e #f) *const)
            ((eq? e #t) *const)
            ((eq? e `cons) *const)
            ((eq? e `car) *const)
            ((eq? e `cdr) *const)
            ((eq? e `null?) *const)
            ((eq? e `eq?) *const)
            ((eq? e `atom?) *const)
            ((eq? e `zero?) *const)
            ((eq? e `add1) *const)
            ((eq? e `sub1) *const)
            ((eq? e `number?) *const)
            (else *identifier)
        )
    )
)

(define *const
    (lambda (e table)
        (cond
            ((number? e) e)
            ((eq? e #f) #f)
            ((eq? e #t) #t)
            (else (pair `primitive e))
        )
    )
)

(define initial-table
    (lambda (name) (car `()))
)
(define *identifier
    (lambda (e table)
        (lookup-in-table e table initial-table)
    )
)

; (display (atom-to-action 5))
; (newline)

(define list-to-action
    (lambda (e)
        (cond
            ((atom? (car e))
                (cond
                    ((eq? (car e) `quote) *quote)
                    ((eq? (car e) `lambda) *lambda)
                    ((eq? (car e) `cond) *cond)
                    (else *application)
                ))
            (else *application)
        )
    )
)

(define *quote
    (lambda (e table)
        (second e)
    )
)

(define *lambda
    (lambda (e table)
        (pair `non-primitive (cons table (cdr e)))
    )
)

(define question-of first)
(define answer-of second)
(define evcon
    (lambda (lines table)
        (cond
            ((eq? (question-of (car lines)) `else) (meaning (answer-of (car lines)) table))
            ((meaning (question-of (car lines)) table) (meaning (answer-of (car lines)) table))
            (else (evcon (cdr lines) table))
        )
    )
)
(define *cond
    (lambda (e table)
        (evcon (cdr e) table)
    )
)

(define function-of car)
(define arguments-of cdr)
(define *application
    (lambda (e table)
        (*apply
            (meaning (function-of e) table)
            (evlis (arguments-of e) table)
        )
    )
)

(define test
    (lambda (func arg-vals)
        (display func)
        (newline)
        (display arg-vals)
    ))

(define primitive?
    (lambda (func) (eq? (first func) `primitive)))
(define non-primitive?
    (lambda (func) (eq? (first func) `non-primitive)))
(define *apply
    (lambda (func arg-vals)
        (cond
            ((primitive? func) (apply-primitive (second func) arg-vals))
            ((non-primitive? func) (apply-closure (second func) arg-vals))
        )
    )
)

(define apply-primitive
    (lambda (func-name arg-vals)
        (cond
            ((eq? func-name `cons) (cons (first arg-vals) (second arg-vals)))
            ((eq? func-name `car) (car (first arg-vals)))
            ((eq? func-name `cdr) (cdr (first arg-vals)))
            ((eq? func-name `null?) (null? (first arg-vals)))
            ((eq? func-name `eq?) (eq? (first arg-vals) (second arg-vals)))
            ((eq? func-name `atom?) (:atom? (first arg-vals)))
            ((eq? func-name `zero?) (zero? (first arg-vals)))
            ((eq? func-name `add1) (add1 (first arg-vals)))
            ((eq? func-name `sub1) (sub1 (first arg-vals)))
            ((eq? func-name `number?) (number? (first arg-vals)))
        )
    )
)
(define :atom?
    (lambda (x)
        (cond
            ((atom? x) #t)
            ((null? x) #f)
            ((primitive? x) #t)
            ((non-primitive? x) #t)
            (else #f)
        )
    )
)

(define apply-closure
    (lambda (func-closure arg-vals)
        (meaning (body-of func-closure) (cons (pair (formal-of func-closure) arg-vals) (table-of func-closure)))
    )
)

(define table-of first)
(define formal-of second)
(define body-of (lambda (x) (car (cdr (cdr x)))))

; (display (body-of `(1 2 3)))

(define value
    (lambda (e)
        (meaning e `())
    )
)

(define meaning
    (lambda (e table)
        ((expression-to-action e) e table)
    )
)

(define evlis
    (lambda (args table)
        (cond
            ((null? args) `())
            (else (cons (meaning (car args) table) (evlis (cdr args) table)))
        )
    )
)

(display (value `(add1 5)))
(newline)
(display ((lambda (x) (add1 x)) 5))
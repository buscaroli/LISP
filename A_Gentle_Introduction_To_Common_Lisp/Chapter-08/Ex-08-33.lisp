(defun my-remove (value mixed-list)
  "Recursive implementation of the remove function"
  (cond ((null mixed-list) NIL)
        ((equal value (car mixed-list)) (my-remove value (cdr mixed-list)))
        (t (cons (car mixed-list) (my-remove value (cdr mixed-list))))))

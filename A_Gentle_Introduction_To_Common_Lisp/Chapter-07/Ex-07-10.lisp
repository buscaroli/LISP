;;; Exercise 7.10 - A Gentle Introduction to Common Lisp
(defvar note-table)
;; note-table is a table that links
;; notes to numbers
(setf note-table
  '((c         1)
    (c-sharp   2)
    (d         3)
    (d-sharp   4)
    (e         5)
    (f         6)
    (f-sharp   7)
    (g         8)
    (g-sharp   9)
    (a        10)
    (a-sharp  11)
    (b        12)))

(defun numbers (notes-list)
  "Takes a list made of notes and returns the
    corresponding numbers found in note-table.
    CADR is the first element in the second level
    of nesting ((1 x x) (1 x x)).
    ASSOC returns the corresponding number using
    note-table as the association table."
  (mapcar #'(lambda (note)
               (cadr (assoc note note-table)))
          notes-list))



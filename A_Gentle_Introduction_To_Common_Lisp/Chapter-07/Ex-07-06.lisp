(lambda (x)
  (cond ((or (equalp T x)
             (equalp NIL x)) T)
        (t NIL)))


(defun t-nil-only (x)
"Returns T if the item is either 
  T or NIL, returns NIL otherwise"
  (cond ((or (equalp T x)
             (equalp NIL x)) T)
        (t NIL)))

(defun map-t-nil-only (x)
  "Applicative version of t-nil-only,
    used on a list"
  (mapcar #'t-nil-only x))

(defun map-t-nil-only-lambda (n)
  "Same function implemented with a lambda"
  (mapcar #'(lambda (x)
     (cond ((or (equalp T x)
                (equalp NIL x)) T)
           (t NIL))) n))

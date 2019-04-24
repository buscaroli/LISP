(defun find-nested (nested-list)
  "Returns the first element of a list
    that is itself a non-NIL list. My interpretation
    is that if the first element in the list is NIL it
    should skip it and give the first non nil element"
  (find-if #'(lambda (x)
               (not (equal nil (first x))))
           nested-list))
